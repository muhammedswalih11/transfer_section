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

// class CustomInputField extends StatelessWidget {
//   final String label;
//   final String value;
//   final bool showDropdown;
//   final VoidCallback? onTap;
//   final TextEditingController? controller;

//   const CustomInputField({
//     super.key,
//     required this.label,
//     required this.value,
//     this.showDropdown = false,
//     this.onTap,
//     this.controller, required Container suffixWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final effectiveController = controller ?? TextEditingController();

//     // IMPORTANT FIX — update controller text WITHOUT cursor jump
//     if (effectiveController.text != value) {
//       effectiveController.value = effectiveController.value.copyWith(
//         text: value,
//         selection: TextSelection.collapsed(offset: value.length),
//       );
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: AbsorbPointer(
//         absorbing: true, // disable typing
//         child: TextField(
//           controller: effectiveController,
//           decoration: InputDecoration(
//             labelText: label,
//             labelStyle: const TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.auto,
//             suffixIcon: showDropdown
//                 ? const Icon(Icons.keyboard_arrow_down_rounded, size: 26)
//                 : null,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xffdcdcdc)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(
//                 color: Color(0xff7E7E7E),
//                 width: 1.3,
//               ),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 14,
//               vertical: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
