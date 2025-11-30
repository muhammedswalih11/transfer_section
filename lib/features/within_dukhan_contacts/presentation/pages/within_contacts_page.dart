import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/within_dukhan/presentation/pages/within_dukhan_confirmpage.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/beneficiary_contact_sheet.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/purpose_bottom_sheet.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/purpose_of_transfer.dart';
import 'package:transfer_section/features/within_dukhan_contacts/presentation/pages/transfer_bt_sheettest.dart';
import 'package:transfer_section/features/within_dukhan_contacts/presentation/widgets/bottom_sheet.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/amount_filed.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/remarks_field.dart';
import 'package:transfer_section/features/within_dukhan_contacts/data/contact_model.dart';

import '../../../../core/utils/colors.dart';
import '../../../within_own_account/presentation/providers/dropdown_provider.dart';
import '../../../within_own_account/presentation/widgets/account_picker_sheet.dart';
import '../../../within_own_account/presentation/widgets/info_note.dart';
import '../../../within_own_account/presentation/widgets/limit_bottomsheet.dart';
import '../../../within_own_account/presentation/widgets/limit_info-tile.dart';
import '../../../within_own_account/presentation/widgets/select_account_field.dart';
import '../../../within_own_account/presentation/widgets/terms_and_conditions_checkbox.dart';

class WithinContactsPage extends ConsumerWidget {
  const WithinContactsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final selectedFromAccount = ref.watch(selectedFromAccountProvider);
    final selectedToAccount = ref.watch(selectedToAccountProvider);
    final selectedToBeneficiary = ref.watch(toBenificiaryProvider);
    final amountController = ref.watch(amountControllerProvider);
    final remarksController = ref.watch(remarksControllerProvider);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 7, 110, 141),
              DefaultColors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: DefaultColors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Within Contacts',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: DefaultColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.025),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.050,
                    left: screenWidth * 0.040,
                    right: screenWidth * 0.040,
                    bottom: screenHeight * 0.030,
                  ),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AccountInputField(
                            labeltext: 'From Account',

                            selectedValue: selectedFromAccount,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                builder: (_) {
                                  return AccountPickerSheet(
                                    disabledAccountId: selectedToAccount?['id'],

                                    title: "Select From Account",
                                    subtitle:
                                        "Choose the account you'd like to transfer from",
                                    onSelected: (acct) {
                                      ref
                                              .read(
                                                selectedFromAccountProvider
                                                    .notifier,
                                              )
                                              .state =
                                          acct;

                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              );
                            },
                          ),

                          SizedBox(
                            height: screenHeight * 0.017,
                            child: selectedFromAccount == null
                                ? null
                                : Padding(
                                    padding: EdgeInsets.only(
                                      left: screenWidth * 0.03,
                                    ),
                                    child: Text(
                                      selectedFromAccount['balance'] ?? '',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.030,
                                        fontWeight: FontWeight.w600,
                                        color: DefaultColors.black,
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          AccountInputField(
                            labeltext: 'To Beneficiary/Contact',

                            selectedValue: selectedToBeneficiary,
                            onTap: () async {
                              final result =
                                  await showModalBottomSheet<dynamic>(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (_) {
                                      return TransferBottomSheetWidget();
                                    },
                                  );

                              if (result != null) {
                                // Handle different result types
                                String accountNumber = '';
                                if (result is ContactModel) {
                                  accountNumber = result.accountNo;
                                } else {
                                  // Assume it's BeneficiaryModel
                                  accountNumber = result.accNumber;
                                }

                                ref
                                    .read(toBenificiaryProvider.notifier)
                                    .state = {
                                  'id': result.name,
                                  'title': result.name,
                                  'subtitle': accountNumber,
                                };
                              }
                            },
                          ),
                          SizedBox(height: screenHeight * 0.032),
                          AmountFiled(controller: amountController),
                          SizedBox(height: screenHeight * 0.008),
                          LimitInfoTile(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(22),
                                  ),
                                ),
                                isScrollControlled: true,
                                builder: (_) => LimitsBottomSheet(),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.032),
                          PurposeOfTransfer(
                            labeltext: 'Purpose of Transfer',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(22),
                                  ),
                                ),
                                isScrollControlled: true,
                                builder: (_) => UniversalPurposeSheet(
                                  isSubPurpose: false,
                                  onPurposeSelected: (purpose) {
                                    ref
                                            .read(
                                              selectedPurposeProvider.notifier,
                                            )
                                            .state =
                                        purpose;
                                  },
                                ),
                              );
                            },
                          ),
                          Consumer(
                            builder: (context, ref, _) {
                              final selectedPurpose = ref.watch(
                                selectedPurposeProvider,
                              );

                              if (selectedPurpose == null)
                                return SizedBox.shrink();

                              return Column(
                                children: [
                                  SizedBox(height: screenHeight * 0.032),

                                  SubPurpose(
                                    labeltext: 'Sub purpose of Transfer',
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(22),
                                          ),
                                        ),
                                        isScrollControlled: true,
                                        builder: (_) => UniversalPurposeSheet(
                                          isSubPurpose: true,
                                          onSubPurposeSelected: (subPurpose) {
                                            ref
                                                    .read(
                                                      selectedSubPurposeProvider
                                                          .notifier,
                                                    )
                                                    .state =
                                                subPurpose;
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.032),
                          RemarksField(controller: remarksController),
                          // SizedBox(height: screenHeight * 0.18),
                          SizedBox(
                            height: ref.watch(amountProvider).isEmpty
                                ? screenHeight * 0.088
                                : screenHeight * 0.02,
                          ),
                          Consumer(
                            builder: (context, ref, _) {
                              final amount = ref.watch(amountProvider);

                              if (amount.isEmpty) return SizedBox.shrink();

                              // Convert amount to double safely
                              final amt = double.tryParse(amount) ?? 0.0;

                              final fee = 4.00; // fixed or dynamic later
                              final total = amt + fee;

                              return Column(
                                children: [
                                  SizedBox(height: screenHeight * 0.02),

                                  // FIRST BOX: FEES
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 18,
                                    ),
                                    decoration: BoxDecoration(
                                      color: DefaultColors.lightblue1,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Fees",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w400,
                                            color: DefaultColors.black,
                                          ),
                                        ),
                                        Text(
                                          "${fee.toStringAsFixed(2)} QAR",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.040,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: screenHeight * 0.001),

                                  // SECOND BOX: TOTAL DEBIT
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 18,
                                    ),
                                    decoration: BoxDecoration(
                                      color: DefaultColors.lightblue1,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Debit Amount",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w400,
                                            color: DefaultColors.black,
                                          ),
                                        ),
                                        Text(
                                          "${total.toStringAsFixed(2)} QAR",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.040,
                                            fontWeight: FontWeight.w700,
                                            color: DefaultColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.016),
                                ],
                              );
                            },
                          ),

                          InfoNote(),
                          SizedBox(height: screenHeight * 0.02),
                          TermsAndConditionsCheckbox(),
                          SizedBox(height: screenHeight * 0.02),
                          Consumer(
                            builder: (context, ref, _) {
                              final isEnabled = ref.watch(
                                isTransferEnabledProvider,
                              );
                              return SizedBox(
                                width: screenWidth,

                                child: ElevatedButton(
                                  onPressed: isEnabled
                                      ? () {
                                          if (!isEnabled) return;
                                          final selectedPurpose = ref.read(
                                            selectedPurposeProvider,
                                          );
                                          final selectedSubPurpose = ref.read(
                                            selectedSubPurposeProvider,
                                          );
                                          final amount = amountController.text;

                                          final fee = 4.00;
                                          final total =
                                              (double.tryParse(amount) ?? 0) +
                                              fee;
                                          final Map<String, String> data = {
                                            "fromAccount":
                                                "${selectedFromAccount!['title']} ${selectedFromAccount['accnumber']}",

                                            "toBeneficiaryContact":
                                                "${selectedToBeneficiary?['title']} ${selectedToBeneficiary?['subtitle']}",

                                            "amount": amountController
                                                .text, // user entered amount only
                                            "fee": fee.toStringAsFixed(
                                              2,
                                            ), // 4.00

                                            "totalAmount": total
                                                .toStringAsFixed(
                                                  2,
                                                ), // amount + fee

                                            "purpose":
                                                "${selectedPurpose?['title'] ?? ''}${selectedSubPurpose != null ? " - $selectedSubPurpose" : ""}",

                                            "remarks": remarksController.text,

                                            "reference":
                                                "REF${DateTime.now().millisecondsSinceEpoch}",
                                          };

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  WithinDukhanConfirmpage(
                                                    transferDataOfWithinDukhan:
                                                        data,
                                                  ),
                                            ),
                                          );
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isEnabled
                                        ? DefaultColors.dashboarddarkBlue
                                        : DefaultColors.graylight,

                                    padding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.013,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Transfer',
                                    style: TextStyle(
                                      color: DefaultColors.white,
                                      fontSize: screenWidth * 0.043,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.05),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
