import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/colors.dart';

class AmountFiled extends StatelessWidget {
  const AmountFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenHeight * 0.065,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: DefaultColors.grayE5, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Amount',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: DefaultColors.gray7D,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      color: DefaultColors.black51,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: DefaultColors.blue9D.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/Flags.svg'),
                      SizedBox(width: 4),
                      Text(
                        'QAR',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: DefaultColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
