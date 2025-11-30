import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class LinkedAccount extends StatelessWidget {
  const LinkedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Linked Bank Account",
          style: TextStyle(
            color: DefaultColors.blackT,
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
          ),
        ),
        SizedBox(height: screenHeight * 0.016),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.036),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: screenHeight * 0.006,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Primary Account",
                    style: TextStyle(
                      color: DefaultColors.blackT,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                  Text(
                    "ABDUL MUHAMMED",
                    style: TextStyle(
                      color: DefaultColors.blackT,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.034,
                    ),
                  ),
                  Text(
                    "1234567890",
                    style: TextStyle(
                      color: DefaultColors.grayTB.withAlpha(153),
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.034,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: DefaultColors.blueLightBase,
                  size: screenWidth * 0.06,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
