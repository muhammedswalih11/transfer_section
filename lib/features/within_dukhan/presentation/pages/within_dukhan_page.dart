import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/beneficiary_contact_sheet.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/purpose_bottom_sheet.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/purpose_of_transfer.dart';

import '../../../../core/utils/colors.dart';

import '../../../within_own_account/presentation/pages/confirm_page.dart';
import '../../../within_own_account/presentation/providers/dropdown_provider.dart';
import '../../../within_own_account/presentation/widgets/account_picker_sheet.dart';
import '../../../within_own_account/presentation/widgets/amount_filed.dart';
import '../../../within_own_account/presentation/widgets/info_note.dart';
import '../../../within_own_account/presentation/widgets/limit_bottomsheet.dart';
import '../../../within_own_account/presentation/widgets/limit_info-tile.dart';
import '../../../within_own_account/presentation/widgets/remarks_field.dart';
import '../../../within_own_account/presentation/widgets/select_account_field.dart';
import '../../../within_own_account/presentation/widgets/terms_and_conditions_checkbox.dart';
import 'within_dukhan_confirmpage.dart';

// class WithinDukhanPage extends ConsumerWidget {
//   const WithinDukhanPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;

//     final selectedFromAccount = ref.watch(selectedFromAccountProvider);
//     final selectedToAccount = ref.watch(selectedToAccountProvider);
//     final amountController = ref.watch(amountControllerProvider);
//     final remarksController = ref.watch(remarksControllerProvider);
//     final toBenificiary = ref.watch(toBenificiaryProvider);
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(top: 35),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               const Color.fromARGB(255, 7, 110, 141),
//               DefaultColors.white,
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: DefaultColors.white,
//                   ),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//                 Text(
//                   'Within Dukhan Bank',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: DefaultColors.white,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.025),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   width: screenWidth,
//                   padding: EdgeInsets.only(
//                     top: screenHeight * 0.050,
//                     left: screenWidth * 0.040,
//                     right: screenWidth * 0.040,
//                   ),
//                   decoration: BoxDecoration(
//                     color: DefaultColors.white,
//                     borderRadius: BorderRadius.circular(28),
//                   ),
//                   child: Column(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           AccountInputField(
//                             labeltext: 'From Account',

//                             selectedValue: selectedFromAccount,
//                             onTap: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 isScrollControlled: true,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(25),
//                                   ),
//                                 ),
//                                 builder: (_) {
//                                   return AccountPickerSheet(
//                                     disabledAccountId: selectedToAccount?['id'],

//                                     title: "Select From Account",
//                                     subtitle:
//                                         "Choose the account you'd like to transfer from",
//                                     onSelected: (acct) {
//                                       ref
//                                               .read(
//                                                 selectedFromAccountProvider
//                                                     .notifier,
//                                               )
//                                               .state =
//                                           acct;

//                                       Navigator.pop(context);
//                                     },
//                                   );
//                                 },
//                               );
//                             },
//                           ),

//                           SizedBox(
//                             height: screenHeight * 0.017,
//                             child: selectedFromAccount == null
//                                 ? null
//                                 : Padding(
//                                     padding: EdgeInsets.only(
//                                       left: screenWidth * 0.03,
//                                     ),
//                                     child: Text(
//                                       selectedFromAccount['balance'] ?? '',
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.030,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                           ),
//                           SizedBox(height: screenHeight * 0.016),
//                           AccountInputField(
//                             labeltext: 'To Beneficiary/Contact',

//                             selectedValue: selectedToAccount,
//                             onTap: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 isScrollControlled: true,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(25),
//                                   ),
//                                 ),
//                                 builder: (_) {
//                                   return AccountPickerSheet(
//                                     disabledAccountId:
//                                         selectedFromAccount?['id'],

//                                     title: "Select To Account",
//                                     subtitle:
//                                         "Choose the account you'd like to transfer to",
//                                     onSelected: (acct) {
//                                       ref
//                                               .read(
//                                                 selectedToAccountProvider
//                                                     .notifier,
//                                               )
//                                               .state =
//                                           acct;
//                                       Navigator.pop(context);
//                                     },
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                           SizedBox(height: screenHeight * 0.042),
//                           AmountFiled(controller: amountController),
//                           SizedBox(height: screenHeight * 0.008),
//                           LimitInfoTile(
//                             onTap: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(22),
//                                   ),
//                                 ),
//                                 isScrollControlled: true,
//                                 builder: (_) => LimitsBottomSheet(),
//                               );
//                             },
//                           ),
//                           SizedBox(height: screenHeight * 0.032),
//                           PurposeOfTransfer(
//                             labeltext: 'Purpose of Transfer',
//                             onTap: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(22),
//                                   ),
//                                 ),
//                                 isScrollControlled: true,
//                                 builder: (_) => PurposeBottomSheet(
//                                   onSelected: (purpose) {
//                                     ref
//                                             .read(
//                                               selectedPurposeProvider.notifier,
//                                             )
//                                             .state =
//                                         purpose;
//                                   },
//                                 ),
//                               );
//                             },
//                           ),
//                           Consumer(
//                             builder: (context, ref, _) {
//                               final selectedPurpose = ref.watch(
//                                 selectedPurposeProvider,
//                               );

//                               if (selectedPurpose == null)
//                                 return SizedBox.shrink();

//                               return Column(
//                                 children: [
//                                   SizedBox(height: screenHeight * 0.032),

//                                   PurposeOfTransfer(
//                                     labeltext: 'Sub Purpose of Transfer',
//                                     onTap: () {
//                                       // You will open sub purpose sheet later
//                                     },
//                                   ),

//                                   SizedBox(height: screenHeight * 0.032),
//                                 ],
//                               );
//                             },
//                           ),
//                           SizedBox(height: screenHeight * 0.032),
//                           RemarksField(controller: remarksController),
//                           SizedBox(height: screenHeight * 0.18),
//                           InfoNote(),
//                           SizedBox(height: screenHeight * 0.02),
//                           TermsAndConditionsCheckbox(),
//                           SizedBox(height: screenHeight * 0.02),
//                           SizedBox(
//                             width: screenWidth,

//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: DefaultColors.graylight,

//                                 padding: EdgeInsets.symmetric(
//                                   vertical: screenHeight * 0.013,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 elevation: 0,
//                               ),
//                               child: Text(
//                                 'Transfer',
//                                 style: TextStyle(
//                                   color: DefaultColors.white,
//                                   fontSize: screenWidth * 0.043,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class WithinDukhanPage extends ConsumerWidget {
  const WithinDukhanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // final accountOptions = ref.watch(accountOptionsProvider);
    // final isFromAccountOpen = ref.watch(fromAccountDropdownProvider);
    // final isToAccountOpen = ref.watch(toAccountDropdownProvider);
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
                  'Within Dukhan',
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
                            labeltext: 'To Beneficiary/Contact',

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
                                  return BeneficiaryBottomSheetContent(
                                    mq: mediaQuery,
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

                                  SizedBox(height: screenHeight * 0.032),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          RemarksField(controller: remarksController),
                          SizedBox(height: screenHeight * 0.18),
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
                                      color: const Color(
                                        0xffe8f4fa,
                                      ), // light blue
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Fees",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${fee.toStringAsFixed(2)} QAR",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 12),

                                  // SECOND BOX: TOTAL DEBIT
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 18,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffe8f4fa),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Debit Amount",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${total.toStringAsFixed(2)} QAR",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

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

                                final selectedPurpose = ref.read(
                                  selectedPurposeProvider,
                                );
                                final selectedSubPurpose = ref.read(
                                  selectedSubPurposeProvider,
                                );
                                final amount = amountController.text;

                                final fee = 4.00;
                                final total =
                                    (double.tryParse(amount) ?? 0) + fee;
                                final Map<String, String> data = {
                                  "fromAccount":
                                      "${selectedFromAccount['title']} ${selectedFromAccount['accnumber']}",

                                  "toBeneficiaryContact":
                                      "${selectedToAccount['title']} ${selectedToAccount['accnumber']}",

                                  "amount": amountController
                                      .text, // user entered amount only
                                  "fee": fee.toStringAsFixed(2), // 4.00

                                  "totalAmount": total.toStringAsFixed(
                                    2,
                                  ), // amount + fee

                                  "purpose":
                                      "${selectedPurpose?['title'] ?? ''}${selectedSubPurpose != null ? " - $selectedSubPurpose" : ""}",

                                  "remarks": remarksController.text,

                                  "reference":
                                      "REF${DateTime.now().millisecondsSinceEpoch}",
                                };

                                // final Map<String, String> data = {
                                //   "fromAccount":
                                //       "${selectedFromAccount['title']} ${selectedFromAccount['accnumber']}",
                                //   "to Beneficiary/Contact":
                                //       "${selectedToAccount['title']} ${selectedToAccount['accnumber']}",

                                //   "amount": total.toStringAsFixed(
                                //     2,
                                //   ), // total debit amount
                                //   "fee": fee.toStringAsFixed(2),

                                //   "purpose of Transfer":
                                //       "${selectedPurpose?['title'] ?? ''}${selectedSubPurpose != null ? " - $selectedSubPurpose" : ""}",

                                //   "remarks": remarksController.text,
                                //   "reference":
                                //       "REF${DateTime.now().millisecondsSinceEpoch}",
                                // };

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WithinDukhanConfirmpage(
                                      transferDataOfWithinDukhan: data,
                                    ),
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
