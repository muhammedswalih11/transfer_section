import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class SelectAccountField extends StatelessWidget {
  final String label;
  final double screenWidth;
  final double screenHeight;
  final bool isOpen;
  final List<String> options;
  final VoidCallback onTap;
  final Function(String) onOptionSelected;
  final String? selectedValue;

  const SelectAccountField({
    super.key,
    required this.label,
    required this.screenWidth,
    required this.screenHeight,
    required this.isOpen,
    required this.options,
    required this.onTap,
    required this.onOptionSelected,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenHeight * 0.065,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            border: Border.all(color: DefaultColors.grayE5, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  selectedValue ?? label,
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    color: DefaultColors.black51,
                  ),
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: DefaultColors.black51,
                  size: screenWidth * 0.06,
                ),
              ),
            ],
          ),
        ),
        // if (isOpen)
        //   Container(
        //     margin: EdgeInsets.only(top: screenHeight * 0.005),
        //     decoration: BoxDecoration(
        //       color: DefaultColors.white,
        //       borderRadius: BorderRadius.circular(screenWidth * 0.025),
        //       border: Border.all(color: DefaultColors.grayE5, width: 1),
        //     ),
        //     child: Column(
        //       children: options.map((option) {
        //         return InkWell(
        //           onTap: () {
        //             onOptionSelected(option);
        //           },
        //           child: Padding(
        //             padding: EdgeInsets.symmetric(
        //               horizontal: screenWidth * 0.04,
        //               vertical: screenHeight * 0.018,
        //             ),
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Text(
        //                     option,
        //                     style: TextStyle(
        //                       fontSize: screenWidth * 0.038,
        //                       color: DefaultColors.black51,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       }).toList(),
        //     ),
        //   ),
      ],
    );
  }
}
