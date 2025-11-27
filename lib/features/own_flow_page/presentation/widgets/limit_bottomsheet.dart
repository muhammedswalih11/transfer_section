import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class LimitsBottomSheet extends StatelessWidget {
  const LimitsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.012,
        left: screenWidth * 0.04,
        right: screenWidth * 0.04,
        bottom: screenHeight * 0.03,
      ),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: screenHeight * 0.006,
              width: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: DefaultColors.graylight,
                borderRadius: BorderRadius.circular(50),
              ),
              margin: const EdgeInsets.only(bottom: 14),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),

          Text(
            "Limits",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w700,
              color: DefaultColors.black,
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          Container(
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: DefaultColors.grayE5),
              color: DefaultColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    top: screenHeight * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum amount per transaction",
                        style: TextStyle(
                          fontSize: screenWidth * 0.034,
                          color: DefaultColors.grayMedBase,
                        ),
                      ),
                      Text(
                        "0.01 QAR",
                        style: TextStyle(
                          fontSize: screenWidth * 0.038,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.006),
                Divider(color: DefaultColors.grayE5),
                SizedBox(height: screenHeight * 0.006),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maximum amount per transaction",
                        style: TextStyle(
                          fontSize: screenWidth * 0.034,
                          color: DefaultColors.grayMedBase,
                        ),
                      ),
                      Text(
                        "100,000.00 QAR",
                        style: TextStyle(
                          fontSize: screenWidth * 0.038,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }
}
