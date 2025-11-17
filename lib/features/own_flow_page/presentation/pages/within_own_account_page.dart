import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/own_flow_page/presentation/widgets/amount_filed.dart';
import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';
import '../widgets/select_account_field.dart';
import '../widgets/remarks_field.dart';
import '../widgets/terms_and_conditions_checkbox.dart';
import '../widgets/transfer_button.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Row(
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
                        fontSize: screenWidth * 0.048,
                        fontWeight: FontWeight.bold,
                        color: DefaultColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectAccountField(
                          label: 'From Account',
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          isOpen: isFromAccountOpen,
                          options: accountOptions,
                          onTap: () {
                            ref
                                    .read(fromAccountDropdownProvider.notifier)
                                    .state =
                                !isFromAccountOpen;
                          },
                          onOptionSelected: (option) {
                            ref
                                    .read(selectedFromAccountProvider.notifier)
                                    .state =
                                option;
                            ref
                                    .read(fromAccountDropdownProvider.notifier)
                                    .state =
                                false;
                          },
                          selectedValue: selectedFromAccount,
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        SelectAccountField(
                          label: 'To Account',
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          isOpen: isToAccountOpen,
                          options: accountOptions,
                          onTap: () {
                            ref.read(toAccountDropdownProvider.notifier).state =
                                !isToAccountOpen;
                          },
                          onOptionSelected: (option) {
                            ref.read(selectedToAccountProvider.notifier).state =
                                option;
                            ref.read(toAccountDropdownProvider.notifier).state =
                                false;
                          },
                          selectedValue: selectedToAccount,
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        AmountFiled(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        RemarksField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        SizedBox(height: screenHeight * 0.35),
                        TermsAndConditionsCheckbox(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TransferButton(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onPressed: () {
                            // Transfer action
                          },
                        ),
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
