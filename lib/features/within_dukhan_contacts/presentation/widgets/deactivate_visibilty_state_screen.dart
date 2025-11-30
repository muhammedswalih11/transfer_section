import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/colors.dart';
import '../controllers/account_selection_provider.dart';

class DeactivateVisibiltyStateScreen extends ConsumerWidget {
  const DeactivateVisibiltyStateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.56,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your account is private",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: DefaultColors.blackT,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Change to visible so friends can see you",
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w500,
                color: DefaultColors.grayTB.withAlpha(153),
              ),
            ),
            SizedBox(height: screenHeight * 0.028),
            ElevatedButton(
              onPressed: () {
                ref.read(contentStepProvider.notifier).state = 4;
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: DefaultColors.blueT1),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
              ),
              child: Text(
                "Enable Visibility",
                style: TextStyle(
                  color: DefaultColors.blueT1,
                  fontSize: screenWidth * 0.036,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
