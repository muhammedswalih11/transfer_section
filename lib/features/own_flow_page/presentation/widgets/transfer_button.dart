import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class TransferButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final VoidCallback? onPressed;

  const TransferButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.skyBlue,
          foregroundColor: DefaultColors.black51,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
          ),
          elevation: 0,
        ),
        child: Text(
          'Transfer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: DefaultColors.white,
          ),
        ),
      ),
    );
  }
}
