import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/custom_input_field.dart';
import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';

// class AmountFiled extends StatelessWidget {
//   const AmountFiled({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: screenHeight * 0.062,
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//             decoration: BoxDecoration(
//               color: DefaultColors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: DefaultColors.grayE5, width: 1),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Amount',
//                       hintStyle: TextStyle(
//                         fontSize: screenWidth * 0.038,
//                         color: DefaultColors.grayMedBase,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.038,
//                       color: DefaultColors.black,
//                     ),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: screenWidth * 0.015,
//                     vertical: screenWidth * 0.01,
//                   ),
//                   decoration: BoxDecoration(
//                     color: DefaultColors.lightblue1,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SvgPicture.asset(
//                         'assets/images/Flags.svg',
//                         width: screenWidth * 0.03,
//                       ),
//                       SizedBox(width: screenWidth * 0.01),
//                       Text(
//                         'QAR',
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.032,
//                           fontWeight: FontWeight.bold,
//                           color: DefaultColors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class AmountFiled extends ConsumerWidget {
  final TextEditingController controller;
  const AmountFiled({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return CustomInputField(
      label: 'Amount',
      controller: controller,
      suffixWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: DefaultColors.lightblue1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/Flags.svg', width: 20),
            SizedBox(width: screenWidth * 0.01),
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
      onChanged: (value) {
        ref.read(amountProvider.notifier).state = value;
      },

      inputType: TextInputType.number,
    );
  }
}
