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
        color: DefaultColors.blue00,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.04),

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
              border: Border.all(color: DefaultColors.grayFE),
              color: DefaultColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _limitItem(
                  context,
                  title: "Minimum amount per transaction",
                  value: "1.00 QAR",
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),

                _divider(context),

                _limitItem(
                  context,
                  title: "Maximum amount per transaction",
                  value: "73,000,500.00 QAR",
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),

                _divider(context),

                _limitItem(
                  context,
                  title: "Maximum transfers per day",
                  value: "35",
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),

                _divider(context),

                _limitItem(
                  context,
                  title: "Maximum transfers per month",
                  value: "310",
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),

                _divider(context),

                _limitItem(
                  context,
                  title: "Maximum amount per day",
                  value: "95,000,000.00 QAR",
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),

                _divider(context),

                _limitItem(
                  context,
                  title: "Maximum amount per month",
                  value: "4,500,000,000.00 QAR",
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.03),

          Center(
            child: SizedBox(
              width: screenWidth,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                  side: BorderSide(color: DefaultColors.flatblue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.flatblue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }

  Widget _limitItem(
    BuildContext context, {
    required String title,
    required String value,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.034,
              color: DefaultColors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.004),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.040,
              fontWeight: FontWeight.bold,
              color: DefaultColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Divider(color: DefaultColors.grayFE, height: 1, thickness: 1);
  }
}
