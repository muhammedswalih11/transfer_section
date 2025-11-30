import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/colors.dart';
import '../controllers/account_selection_provider.dart';
import 'account_selector.dart';
import 'continue_button.dart';

class AccountSelectionContent extends ConsumerWidget {
  const AccountSelectionContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.046),
          GestureDetector(
            onTap: () {
              ref.read(contentStepProvider.notifier).state = 0;
            },
            child: Row(
              spacing: screenWidth * 0.01,
              children: [
                Icon(Icons.arrow_back_ios_new, size: screenWidth * 0.04),
                Text(
                  "Back",
                  style: TextStyle(
                    fontSize: screenWidth * 0.036,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.046),
          SizedBox(
            width: screenWidth * 0.8,
            child: Text(
              "Select your linked account to transfer and receive from your friends",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                color: DefaultColors.blackT,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.046),
          AccountSelector(),
          Spacer(),
          ContinueButton(
            onPressed: () {
              ref.read(contentStepProvider.notifier).state = 3;
            },
          ),
        ],
      ),
    );
  }
}
