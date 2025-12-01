import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';
import '../controllers/account_selection_provider.dart';
import 'continue_button.dart';
import 'visiblity_selector.dart';

class InitialContent extends ConsumerWidget {
  const InitialContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isVisible = ref.watch(visibilityProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isVisible == null)
              SvgPicture.asset(
                'assets/images/Placeholders.svg',
                width: screenWidth * 0.2,
              )
            else
              SizedBox(height: screenHeight * 0.04),
            SizedBox(
              width: screenWidth * 0.5,
              child: Text(
                "Easily send money to your Dukhan Bank contacts",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.blackT,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                "Directly pay your contacts who use Dukhan Bank. No account numbers required.",
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.grayTB.withAlpha(135),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: isVisible == null
                  ? screenHeight * 0.07
                  : screenHeight * 0.04,
            ),
            VisibilitySelector(),
            SizedBox(
              height: isVisible == null
                  ? screenHeight * 0.033
                  : screenHeight * 0.11,
            ),
            ContinueButton(
              onPressed: () {
                final isVisible = ref.read(visibilityProvider);

                if (isVisible == true) {
                  ref.read(contentStepProvider.notifier).state =
                      1; // account selection
                } else if (isVisible == false) {
                  ref.read(contentStepProvider.notifier).state =
                      2; // deactivated content
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
