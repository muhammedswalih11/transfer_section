import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';

// class CustomInputField extends StatelessWidget {
//   final String hint;
//   final bool enabled;
//   final bool showDropdown;
//   final VoidCallback? onDropdownTap;
//   final Widget? trailing;
//   final TextEditingController? controller;
//   final TextInputType? inputType;
//   final bool isBoldHint;

//   const CustomInputField({
//     super.key,
//     required this.hint,
//     this.enabled = true,
//     this.showDropdown = false,
//     this.onDropdownTap,
//     this.trailing,
//     this.controller,
//     this.inputType,
//     this.isBoldHint = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;

//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             controller: controller,
//             enabled: enabled,
//             keyboardType: inputType,

//             decoration: InputDecoration(
//               labelText: hint,
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 16),
//               floatingLabelBehavior: FloatingLabelBehavior.auto,
//               labelStyle: TextStyle(
//                 fontSize: screenWidth * 0.038,
//                 color: const Color(0xFF888888),
//                 fontWeight: isBoldHint ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//             style: TextStyle(
//               fontSize: screenWidth * 0.038,
//               color: Colors.black,
//             ),
//           ),
//         ),

//         /// Trailing widget like QAR box
//         if (trailing != null) ...[const SizedBox(width: 10), trailing!],

//         /// Dropdown button (optional)
//         if (showDropdown)
//           InkWell(
//             onTap: onDropdownTap,
//             child: Icon(
//               Icons.keyboard_arrow_down,
//               size: screenWidth * 0.06,
//               color: Colors.black,
//             ),
//           ),
//       ],
//     );
//   }
// }

class CustomInputField extends StatelessWidget {
  final String label;
  final String value;
  final bool showDropdown;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextInputType? inputType;

  const CustomInputField({
    super.key,
    required this.label,
    this.value = '',
    this.showDropdown = false,

    this.onTap,
    this.suffixWidget,
    this.controller,
    this.inputType,
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
          color: DefaultColors.grayMedBase,
          fontWeight: FontWeight.w500,
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
