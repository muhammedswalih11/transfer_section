import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/account_picker_sheet.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/amount_filed.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/choose_currency_sheet.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/custom_input_field.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/info_note.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/limit_bottomsheet.dart'
    show LimitsBottomSheet;
import 'package:transfer_section/features/within_own_account/presentation/widgets/limit_info-tile.dart';
import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';
import '../widgets/select_account_field.dart';
import '../widgets/remarks_field.dart';
import '../widgets/terms_and_conditions_checkbox.dart';
import 'confirm_page.dart';

class WithinOwnAccountPage extends ConsumerWidget {
  const WithinOwnAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final selectedFromAccount = ref.watch(selectedFromAccountProvider);
    final selectedToAccount = ref.watch(selectedToAccountProvider);
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
                  'Within Own Account',
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
                    bottom: screenHeight * 0.020,
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
                          SizedBox(height: screenHeight * 0.016),
                          AccountInputField(
                            labeltext: 'To Account',

                            selectedValue: selectedToAccount,
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
                                    disabledAccountId:
                                        selectedFromAccount?['id'],

                                    title: "Select To Account",
                                    subtitle:
                                        "Choose the account you'd like to transfer to",
                                    onSelected: (acct) {
                                      ref
                                              .read(
                                                selectedToAccountProvider
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
                          SizedBox(height: screenHeight * 0.042),
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
                          RemarksField(controller: remarksController),
                          SizedBox(height: screenHeight * 0.18),
                          InfoNote(),
                          SizedBox(height: screenHeight * 0.02),
                          TermsAndConditionsCheckbox(),
                          SizedBox(height: screenHeight * 0.02),
                          SizedBox(
                            width: screenWidth,

                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedFromAccount == null ||
                                    selectedToAccount == null)
                                  return;

                                final data = {
                                  "fromAccount":
                                      "${selectedFromAccount['title']} ${selectedFromAccount['accnumber']}",
                                  "toAccount":
                                      "${selectedToAccount['title']} ${selectedToAccount['accnumber']}",
                                  "amount": amountController.text,
                                  "remarks": remarksController.text,
                                  "reference":
                                      "REF${DateTime.now().millisecondsSinceEpoch}",
                                };

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ConfirmPage(transferData: data),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DefaultColors.graylight,

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
                          ),
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
