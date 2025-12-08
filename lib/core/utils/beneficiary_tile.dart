// import 'package:flutter/material.dart';
// import 'package:tasks/features/transfers/presentation/constants/beneficiary_action_list.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../dashbord/presentation/widgets/custom_bottom_sheet.dart';
// import '../../domain/models/beneficiary.dart';

// class BeneficiaryTile extends StatelessWidget {
//   final Beneficiary beneficiary;
//   const BeneficiaryTile({super.key, required this.beneficiary});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     /// Build avatar widget
//     final Widget avatar;
//     if (beneficiary.avatarUrl != null && beneficiary.avatarUrl!.isNotEmpty) {
//       avatar = CircleAvatar(
//         radius: screenWidth * 0.064,
//         backgroundImage: NetworkImage(beneficiary.avatarUrl!),
//       );
//     } else if (beneficiary.localImage != null &&
//         beneficiary.localImage!.isNotEmpty) {
//       avatar = CircleAvatar(
//         radius: screenWidth * 0.064,
//         backgroundImage: AssetImage(beneficiary.localImage!),
//       );
//     } else {
//       // Show initials when no image provided
//       final initials = beneficiary.name.trim().isNotEmpty
//           ? beneficiary.name
//                 .trim()
//                 .split(' ')
//                 .map((e) => e.isNotEmpty ? e[0] : '')
//                 .take(2)
//                 .join()
//           : '';

//       avatar = CircleAvatar(
//         backgroundColor: DefaultColors.white,
//         radius: screenWidth * 0.064,
//         child: CircleAvatar(
//           radius: screenWidth * 0.06,
//           backgroundColor: DefaultColors.blueLight1,
//           child: Text(
//             initials,
//             style: const TextStyle(
//               color: DefaultColors.black,
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       );
//     }

//     /// Return ListTile for ALL cases
//     return ListTile(
//       leading: Stack(
//         alignment: AlignmentGeometry.bottomCenter,
//         clipBehavior: Clip.none,
//         children: [
//           avatar,
//           if (beneficiary.isFavourite == true)
//             Positioned(
//               bottom: -10,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Background star (border)
//                   Icon(
//                     Icons.star,
//                     size: screenWidth * 0.076,
//                     color: DefaultColors.white,
//                   ),
//                   // Foreground star
//                   Icon(
//                     Icons.star,
//                     size: screenWidth * 0.06,
//                     color: DefaultColors.yellowT,
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//       title: Text(
//         beneficiary.name,
//         style: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//           color: DefaultColors.black,
//         ),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             beneficiary.id,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: DefaultColors.grayBase,
//             ),
//           ),
//           Text(
//             beneficiary.bank,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: DefaultColors.grayBase,
//             ),
//           ),
//         ],
//       ),
//       trailing: IconButton(
//         color: DefaultColors.grayTB.withAlpha(170),
//         onPressed: () {
//           showModalBottomSheet(
//             isScrollControlled: true,
//             context: context,
//             builder: (context) {
//               return Expanded(
//                 child: CustomBottomSheet(
//                   title: "Select an action",
//                   itemList: beneficiaryActionItems,
//                 ),
//               );
//             },
//           );
//         },
//         icon: Icon(Icons.more_vert),
//       ),
//     );
//   }
// }
