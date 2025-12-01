import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

class ShareActionRow extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // ← NEW

  const ShareActionRow({
    super.key,
    required this.text,
    required this.onTap, // ← NEW
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/Vector.svg',
          width: screenWidth * 0.035,
          color: DefaultColors.flatblue,
        ),
        TextButton(
          onPressed: onTap, // ← UPDATED (uses your custom tap action)
          child: Text(
            text,
            style: TextStyle(
              color: DefaultColors.flatblue,
              fontSize: screenWidth * 0.040,
            ),
          ),
        ),
      ],
    );
  }
}
