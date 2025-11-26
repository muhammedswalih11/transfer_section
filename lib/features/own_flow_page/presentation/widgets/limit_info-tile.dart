import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class LimitInfoTile extends StatelessWidget {
  final VoidCallback onTap;

  const LimitInfoTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          top: screenHeight * 0.005,
          bottom: screenHeight * 0.005,
          left: screenWidth * 0.028,
          right: screenWidth * 0.025,
        ),
        decoration: BoxDecoration(
          color: DefaultColors.lightblue1,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(
              "Limit: ---   |   Transfers Left: --",
              style: TextStyle(
                fontSize: screenWidth * 0.030,
                fontWeight: FontWeight.w600,
                color: DefaultColors.black,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: screenWidth * 0.03,
              color: DefaultColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
