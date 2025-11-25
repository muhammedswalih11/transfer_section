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
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
      decoration: BoxDecoration(
        color: DefaultColors.blue_0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: DefaultColors.blue, size: 18),
          SizedBox(width: 5),
          Column(
            children: [
              Text(
                'Notes : Withdrawal codes expire after 24 hrs from\nthe time of request',
                style: TextStyle(
                  fontSize: 14,
                  color: DefaultColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Notes : Withdrawal codes expire after 24 hrs from\nthe time of request',
                style: TextStyle(
                  fontSize: 14,
                  color: DefaultColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
