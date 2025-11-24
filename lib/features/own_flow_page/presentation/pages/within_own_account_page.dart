import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/own_flow_page/presentation/widgets/account_picker_sheet.dart';
import 'package:transfer_section/features/own_flow_page/presentation/widgets/amount_filed.dart';
import 'package:transfer_section/features/own_flow_page/presentation/widgets/limit_bottomsheet.dart'
    show LimitsBottomSheet;
import 'package:transfer_section/features/own_flow_page/presentation/widgets/limit_info-tile.dart';
import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';
import '../widgets/select_account_field.dart';
import '../widgets/remarks_field.dart';
import '../widgets/terms_and_conditions_checkbox.dart';

class WithinOwnAccountPage extends ConsumerWidget {
  const WithinOwnAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final accountOptions = ref.watch(accountOptionsProvider);
    final isFromAccountOpen = ref.watch(fromAccountDropdownProvider);
    final isToAccountOpen = ref.watch(toAccountDropdownProvider);
    final selectedFromAccount = ref.watch(selectedFromAccountProvider);
    final selectedToAccount = ref.watch(selectedToAccountProvider);

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
        child: SafeArea(
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
              SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectAccountField(
                          label: 'From Account',

                          isOpen: isFromAccountOpen,
                          options: accountOptions,
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

                          onOptionSelected: (_) {},
                        ),
                        if (selectedFromAccount != null) ...[
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              selectedFromAccount['balance'] ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: 20),
                        SelectAccountField(
                          label: 'To Account',

                          isOpen: isToAccountOpen,
                          options: accountOptions,
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
                                  disabledAccountId: selectedFromAccount?['id'],

                                  title: "Select From Account",
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
                          onOptionSelected: (_) {},
                        ),
                        SizedBox(height: 20),
                        AmountFiled(),
                        SizedBox(height: 5),
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
                              builder: (_) => const LimitsBottomSheet(),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        RemarksField(),
                        SizedBox(height: screenHeight * 0.30),
                        TermsAndConditionsCheckbox(),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: DefaultColors.skyBlue,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Transfer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
