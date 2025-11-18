import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class SelectAccountField extends StatelessWidget {
  final String label;

  final bool isOpen;
  final List<String> options;
  final VoidCallback onTap;
  final Function(String) onOptionSelected;
  final String? selectedValue;

  const SelectAccountField({
    super.key,
    required this.label,

    required this.isOpen,
    required this.options,
    required this.onTap,
    required this.onOptionSelected,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenHeight * 0.065,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: DefaultColors.grayE5, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  selectedValue ?? label,
                  style: TextStyle(
                    fontSize: 17,
                    color: DefaultColors.gray7D,
                    fontWeight: FontWeight.bold,
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
      ],
    );
  }
}
