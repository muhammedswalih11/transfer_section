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
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: DefaultColors.blue9D,
              size: screenWidth * 0.04,
            ),
            SizedBox(width: screenWidth * 0.03),
            Text(
              'Daily Limit : 50,000 QAR',
              style: TextStyle(
                fontSize: screenHeight * 0.013,
                color: DefaultColors.grayMedBase,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
