import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';

// class CurrencyPickerSheet extends ConsumerWidget {
//   final String? selectedCurrency;
//   final ValueChanged<String> onSelected;

//   const CurrencyPickerSheet({
//     super.key,
//     required this.selectedCurrency,
//     required this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context , WidgetRef ref) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//       ref.read(tempCurrencySelectionProvider.notifier).state ??= selectedCurrency;

//     final tempSelected = ref.watch(tempCurrencySelectionProvider);

//     final currencies = [
//       {
//         "code": "QAR",
//         "name": "Qatari Riyal",
//         "icon": "assets/images/qatar.svg",
//       },
//       {"code": "USD", "name": "US Dollar", "icon": "assets/images/usa.svg"},
//       {"code": "EUR", "name": "Euro", "icon": "assets/images/eur.svg"},
//       {
//         "code": "GBP",
//         "name": "Pound Sterling",
//         "icon": "assets/images/gbp.svg",
//       },
//     ];

//     return Container(
//       padding: EdgeInsets.only(
//         top: screenHeight * 0.015,
//         left: screenWidth * 0.045,
//         right: screenWidth * 0.045,
//         bottom: screenHeight * 0.03,
//       ),
//       decoration: BoxDecoration(
//         color: DefaultColors.white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Handle
//           Container(
//             height: screenHeight * 0.006,
//             width: screenWidth * 0.12,
//             decoration: BoxDecoration(
//               color: DefaultColors.graylight,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             margin: const EdgeInsets.only(bottom: 18),
//           ),

//           // Title
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Choose Currency",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.055,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),

//           SizedBox(height: screenHeight * 0.02),

//           // Currency List
//           Container(
//             decoration: BoxDecoration(
//               color: DefaultColors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: const Color(0xFFE6E6E6)),
//             ),
//             child: Column(
//               children: currencies.map((item) {
//                 return Column(
//                   children: [
//                     _currencyItem(
//                       context,
//                       iconPath: item["icon"]!,
//                       code: item["code"]!,
//                       name: item["name"]!,
//                       isSelected: selectedCurrency == item["code"],
//                       onTap: () {
//                         Navigator.pop(context);
//                         onSelected(item["code"]!);
//                       },
//                     ),
//                     if (item != currencies.last)
//                       Container(height: 1, color: const Color(0xFFE6E6E6)),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),

//           SizedBox(height: screenHeight * 0.025),

//           // Close Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 onSelected(tempSelection!);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0A3D91),
//                 padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 0,
//               ),
//               child: Text(
//                 "Close",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.045,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _currencyItem(
//     BuildContext context, {
//     required String iconPath,
//     required String code,
//     required String name,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
//         child: Row(
//           children: [
//             SvgPicture.asset(iconPath, width: screenWidth * 0.10),
//             const SizedBox(width: 12),

//             // Texts
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   code,
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.042,
//                     fontWeight: FontWeight.w700,
//                     color: DefaultColors.black,
//                   ),
//                 ),
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.035,
//                     color: DefaultColors.grayTB.withAlpha(180),
//                   ),
//                 ),
//               ],
//             ),

//             const Spacer(),

//             // Radio icon
//             Icon(
//               isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
//               color: isSelected ? DefaultColors.flatblue : Colors.grey,
//               size: screenWidth * 0.055,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CurrencyPickerSheet extends ConsumerWidget {
  final String? selectedCurrency;
  final ValueChanged<String> onSelected;

  const CurrencyPickerSheet({
    super.key,
    required this.selectedCurrency,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final tempSelected = ref.watch(tempCurrencySelectionProvider);

    // Initialize temp selection using a post-frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(tempCurrencySelectionProvider) == null) {
        ref.read(tempCurrencySelectionProvider.notifier).state =
            selectedCurrency;
      }
    });

    final currencies = [
      {
        "code": "QAR",
        "name": "Qatari Riyal",
        "icon": "assets/images/qatar.svg",
      },
      {"code": "USD", "name": "US Dollar", "icon": "assets/images/usa.svg"},
      {"code": "EUR", "name": "Euro", "icon": "assets/images/eur.svg"},
      {
        "code": "GBP",
        "name": "Pound Sterling",
        "icon": "assets/images/gbp.svg",
      },
    ];

    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.015,
        left: screenWidth * 0.045,
        right: screenWidth * 0.045,
        bottom: screenHeight * 0.03,
      ),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            height: screenHeight * 0.006,
            width: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: DefaultColors.graylight,
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(bottom: 18),
          ),

          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Choose Currency",
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Currency List
          Container(
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE6E6E6)),
            ),
            child: Column(
              children: currencies.map((item) {
                return Column(
                  children: [
                    _currencyItem(
                      context,
                      ref: ref,
                      iconPath: item["icon"]!,
                      code: item["code"]!,
                      name: item["name"]!,
                      isSelected: tempSelected == item["code"], // <-- FIXED
                      onTap: () {
                        // Update temporary selection ONLY
                        ref.read(tempCurrencySelectionProvider.notifier).state =
                            item["code"]; // <-- FIXED
                      },
                    ),
                    if (item != currencies.last)
                      Container(height: 1, color: const Color(0xFFE6E6E6)),
                  ],
                );
              }).toList(),
            ),
          ),

          SizedBox(height: screenHeight * 0.025),

          // Close Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                // Apply FINAL selection
                if (tempSelected != null) onSelected(tempSelected);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A3D91),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Text(
                "Close",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _currencyItem(
    BuildContext context, {
    required WidgetRef ref,
    required String iconPath,
    required String code,
    required String name,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: screenWidth * 0.10),
            const SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.w700,
                    color: DefaultColors.black,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: DefaultColors.grayTB.withAlpha(180),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? DefaultColors.flatblue : Colors.grey,
              size: screenWidth * 0.055,
            ),
          ],
        ),
      ),
    );
  }
}
