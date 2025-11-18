import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class CircleActionButtton extends StatelessWidget {
  const CircleActionButtton({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        circleButton(Icons.search, screenWidth, screenHeight),
        SizedBox(width: 4),
        circleButton(Icons.add, screenWidth, screenHeight),
      ],
    );
  }

  Widget circleButton(IconData icon, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth * 0.08,
        height: screenWidth * 0.08,
        decoration: BoxDecoration(
          color: DefaultColors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: screenWidth * 0.053,
          color: DefaultColors.white,
        ),
      ),
    );
  }
}
