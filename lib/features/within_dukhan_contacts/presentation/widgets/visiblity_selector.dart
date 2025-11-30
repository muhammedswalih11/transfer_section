import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/within_dukhan_contacts/presentation/controllers/account_selection_provider.dart';

import '../../../../core/utils/colors.dart';

class VisibilitySelector extends ConsumerWidget {
  const VisibilitySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isVisible = ref.watch(visibilityProvider);

    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.blue04,
        borderRadius: BorderRadius.circular(screenWidth * 0.028),
      ),

      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.028),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your Visibility",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.036, //14
                color: DefaultColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            RadioListTile<bool>(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activate Visibility",
                    style: TextStyle(
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.black,
                    ),
                  ),
                  Text(
                    "Contacts who have your number can see you in their list",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                      color: DefaultColors.gray7D,
                    ),
                  ),
                ],
              ),
              value: true,
              groupValue: isVisible,
              onChanged: (value) {
                ref.read(visibilityProvider.notifier).state = value;
              },
            ),
            RadioListTile<bool>(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deactivate Visibility",
                    style: TextStyle(
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.black,
                    ),
                  ),
                  Text(
                    "You won't appear in anyone's list and can't see others",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                      color: DefaultColors.grayTB.withAlpha(135),
                    ),
                  ),
                ],
              ),
              value: false,
              groupValue: isVisible,
              onChanged: (value) {
                ref.read(visibilityProvider.notifier).state = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
