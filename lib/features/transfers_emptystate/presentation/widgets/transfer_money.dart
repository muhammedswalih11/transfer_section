import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

class TransferMoneyCard extends StatelessWidget {
  const TransferMoneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            DefaultColors.blueLightBase,
            DefaultColors.dashboardLightBlue,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Transfer Money",
                  style: TextStyle(
                    color: DefaultColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Free 5 International Transfers",
                  style: TextStyle(
                    color: DefaultColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SvgPicture.asset("assets/images/transfer.svg"),
          ],
        ),
      ),
    );
  }
}
