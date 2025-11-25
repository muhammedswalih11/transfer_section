import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class RemarksField extends StatelessWidget {
  const RemarksField({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      height: screenHeight * 0.065,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.grayE5, width: 1),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Remarks (Optional)',
          hintStyle: TextStyle(
            fontSize: 17,
            color: DefaultColors.gray7D,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextStyle(fontSize: 17, color: DefaultColors.black),
      ),
    );
  }
}
