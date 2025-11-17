import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class RemarksField extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const RemarksField({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.065,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.025),
        border: Border.all(color: DefaultColors.grayE5, width: 1),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Remarks (Optional)',
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.038,
            color: DefaultColors.black51,
          ),
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.038,
          color: DefaultColors.black51,
        ),
      ),
    );
  }
}
