import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String value;
  final bool showDropdown;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Function(String)? onChanged;

  const CustomInputField({
    super.key,
    required this.label,
    this.value = '',
    this.showDropdown = false,

    this.onTap,
    this.suffixWidget,
    this.controller,
    this.inputType,
    this.onChanged,
  });

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: DefaultColors.grayE5, width: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      // ?..text = controller!.text.isEmpty
      //     ? value
      //     : controller!.text, // <-- important
      readOnly: onTap != null,
      onTap: onTap,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: screenWidth * 0.038,
          color: DefaultColors.gray7D,
          fontWeight: FontWeight.w400,
        ),

        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),

        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (suffixWidget != null)
              Padding(
                padding: EdgeInsets.only(
                  right: showDropdown ? 0 : screenWidth * 0.04,
                ),
                child: suffixWidget!,
              ),
            if (showDropdown)
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: screenWidth * 0.06,
              ),
          ],
        ),

        suffixIconConstraints: BoxConstraints(
          minWidth: showDropdown ? screenWidth * 0.1 : 0,
          minHeight: screenHeight * 0.05,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
      ),
      style: TextStyle(fontSize: screenWidth * 0.038),
    );
  }
}
