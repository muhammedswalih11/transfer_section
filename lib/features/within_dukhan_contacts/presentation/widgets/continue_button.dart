import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: screenWidth * 0.14,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.blueT1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.038),
          ),
        ),
        child: Text(
          "Continue",
          style: TextStyle(
            color: DefaultColors.white,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
