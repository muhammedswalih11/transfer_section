import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showButton;
  const SectionHeader({
    super.key,
    required this.title,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: DefaultColors.black,
          ),
        ),
        showButton
            ? TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: screenWidth * 0.032,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.blue,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
