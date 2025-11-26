import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class InfoNote extends StatelessWidget {
  const InfoNote({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(
        top: screenHeight * 0.010,
        bottom: screenHeight * 0.010,
        left: screenWidth * 0.025,
        right: screenWidth * 0.050,
      ),
      decoration: BoxDecoration(
        color: DefaultColors.blue_0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: DefaultColors.blue,
            size: screenWidth * 0.04,
          ),
          SizedBox(width: screenWidth * 0.018),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Notes : Withdrawal codes expire after 24 hrs from the time of request',

                  style: TextStyle(
                    fontSize: screenWidth * 0.0325,
                    color: DefaultColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.010),
                Text(
                  'Notes : Withdrawal codes expire after 24 hrs from the time of request',

                  style: TextStyle(
                    fontSize: screenWidth * 0.0325,
                    color: DefaultColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
