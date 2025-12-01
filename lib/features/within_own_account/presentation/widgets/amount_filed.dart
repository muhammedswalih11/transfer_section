import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/custom_input_field.dart';
import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';
import 'currency_picker_sheet.dart';

// class AmountFiled extends ConsumerWidget {
//   final TextEditingController controller;
//   const AmountFiled({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
//     return CustomInputField(
//       label: 'Amount',
//       controller: controller,
//       suffixWidget: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         decoration: BoxDecoration(
//           color: DefaultColors.lightblue1,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset('assets/images/Flags.svg', width: 20),
//             SizedBox(width: screenWidth * 0.01),
//             Text(
//               'QAR',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: DefaultColors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//       onChanged: (value) {
//         ref.read(amountProvider.notifier).state = value;
//       },

//       inputType: TextInputType.number,
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
      suffixWidget: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
            ),
            builder: (_) {
              return CurrencyPickerSheet(
                selectedCurrency: ref.read(selectedCurrencyCodeProvider),
                onSelected: (code) {
                  // update selected code
                  ref.read(selectedCurrencyCodeProvider.notifier).state = code;

                  // update selected icon
                  final icons = {
                    "QAR": "assets/images/qatar.svg",
                    "USD": "assets/images/usa.svg",
                    "EUR": "assets/images/eur.svg",
                    "GBP": "assets/images/gbp.svg",
                  };

                  ref.read(selectedCurrencyIconProvider.notifier).state =
                      icons[code]!;
                },
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: DefaultColors.lightblue1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                ref.watch(selectedCurrencyIconProvider),
                width: 20,
              ),
              SizedBox(width: screenWidth * 0.01),
              Text(
                ref.watch(selectedCurrencyCodeProvider),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      onChanged: (value) {
        ref.read(amountProvider.notifier).state = value;
      },

      inputType: TextInputType.number,
    );
  }
}
