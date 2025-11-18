import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/dotted_border.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/dotted_circle.dart';

class DottedContainerWidget extends StatelessWidget {
  const DottedContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return CustomPaint(
      painter: DottedBorderPainter(
        color: DefaultColors.blue_200,
        radius: screenWidth * 0.069,
        strokeWidth: screenWidth * 0.0042,
        gap: screenWidth * 0.021,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.053,
          vertical: screenHeight * 0.031,
        ),
        decoration: BoxDecoration(
          color: DefaultColors.blue03,
          borderRadius: BorderRadius.circular(screenWidth * 0.069),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DefaultColors.blue04,
              ),
              height: screenWidth * 0.16,
              width: screenWidth * 0.16,
              child: CustomPaint(
                painter: DottedCirclePainter(
                  color: DefaultColors.blue_200,
                  strokeWidth: screenWidth * 0.0042,
                  gap: screenWidth * 0.0185,
                ),
                child: Center(
                  child: index == 0
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: screenWidth * 0.074,
                            color: DefaultColors.blue_200,
                          ),
                        )
                      : null,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
