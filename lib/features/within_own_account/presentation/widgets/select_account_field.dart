import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

// class SelectAccountField extends StatelessWidget {
//   final String label;

//   final bool isOpen;
//   final List<String> options;
//   final VoidCallback onTap;
//   final Function(String) onOptionSelected;
//   // final String? selectedValue;
//   final Map<String, String>? selectedValue;

//   const SelectAccountField({
//     super.key,
//     required this.label,

//     required this.isOpen,
//     required this.options,
//     required this.onTap,
//     required this.onOptionSelected,
//     this.selectedValue,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: screenHeight * 0.062,
//           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//           decoration: BoxDecoration(
//             color: DefaultColors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: DefaultColors.grayE5, width: 1),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(
//                   // selectedValue ?? label,
//                   selectedValue != null
//                       ? '${selectedValue!['title']} (${selectedValue!['accnumber']})'
//                       : label,
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.038,
//                     color: DefaultColors.grayMedBase,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: onTap,
//                 child: Icon(
//                   Icons.keyboard_arrow_down,
//                   color: DefaultColors.black,
//                   size: screenWidth * 0.06,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'custom_input_field.dart';

// class AccountInputField extends StatefulWidget {
//   final String labeltext;
//   final String? value;
//   final Map<String, String>? selectedValue;
//   final VoidCallback onTap;

//   const AccountInputField({
//     super.key,
//     required this.labeltext,
//     required this.onTap,
//     required this.value,
//     this.selectedValue,
//   });

//   @override
//   State<AccountInputField> createState() => _AccountInputFieldState();
// }

// class _AccountInputFieldState extends State<AccountInputField> {
//   late TextEditingController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final displayValue = widget.selectedValue != null
//         ? '${widget.selectedValue!['title']} (${widget.selectedValue!['accnumber']})'
//         : widget.labeltext;
//     _controller.text = displayValue;

//     return CustomInputField(
//       label: widget.labeltext,
//       value: displayValue,
//       showDropdown: true,
//       onTap: widget.onTap,
//       controller: _controller,
//     );
//   }
// }

class AccountInputField extends StatefulWidget {
  final String labeltext;
  final Map<String, String>? selectedValue;
  final VoidCallback onTap;

  const AccountInputField({
    super.key,
    required this.labeltext,
    required this.onTap,
    this.selectedValue,
  });

  @override
  State<AccountInputField> createState() => _AccountInputFieldState();
}

class _AccountInputFieldState extends State<AccountInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If selected -> show value
    if (widget.selectedValue != null) {
      _controller.text =
          '${widget.selectedValue!['title']} (${widget.selectedValue!['accnumber']})';
    } else {
      // If NOT selected -> controller empty (VERY IMPORTANT)
      _controller.text = '';
    }

    return CustomInputField(
      label: widget.labeltext, // floating label only
      value: '', // <<< must be empty to avoid double label
      showDropdown: true,
      onTap: widget.onTap,
      controller: _controller,
    );
  }
}
