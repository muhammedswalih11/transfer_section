import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class AmountFiled extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const AmountFiled({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenHeight * 0.065,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(screenWidth * 0.025),
              border: Border.all(color: DefaultColors.grayE5, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Amount',
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.038,
                        color: DefaultColors.black51,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      color: DefaultColors.black51,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.006,
                  ),
                  decoration: BoxDecoration(
                    color: DefaultColors.blue9D.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: DefaultColors.blue9D, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.flag_circle,
                        size: screenWidth * 0.045,
                        color: DefaultColors.blue9D,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        'QAR',
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.w600,
                          color: DefaultColors.blue9D,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        SizedBox(
          height: screenHeight * 0.065,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: DefaultColors.blue_0,
              foregroundColor: DefaultColors.white,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.025),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Limit',
              style: TextStyle(color: DefaultColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
