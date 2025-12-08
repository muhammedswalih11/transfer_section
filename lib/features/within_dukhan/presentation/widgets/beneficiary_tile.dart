// import 'package:flutter/material.dart';
// import 'package:transfer_section/features/within_dukhan_contacts/presentation/widgets/action_bottom_sheet.dart';

// import '../../../../core/utils/colors.dart';
// import '../../../within_dukhan_contacts/presentation/data/beneficiary_model.dart';

// class BeneficiaryTile extends StatelessWidget {
//   final Beneficiary beneficiary;
//   final VoidCallback? onTap;
//   final bool showActionButton;

//   const BeneficiaryTile({
//     super.key,
//     required this.beneficiary,
//     this.onTap,
//     this.showActionButton = true,
//   });

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
//           backgroundColor: DefaultColors.blue,
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
//     final textColor = beneficiary.isDisabled
//         ? DefaultColors.grayBase
//         : DefaultColors.black;

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: ListTile(
//         onTap: beneficiary.isDisabled ? null : onTap,
//         leading: Opacity(
//           opacity: beneficiary.isDisabled ? 0.5 : 1.0,
//           child: Stack(
//             alignment: AlignmentGeometry.bottomCenter,
//             clipBehavior: Clip.none,
//             children: [
//               avatar,
//               if (beneficiary.isFavourite == true)
//                 Positioned(
//                   bottom: -10,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Background star (border)
//                       Icon(
//                         Icons.star,
//                         size: screenWidth * 0.076,
//                         color: DefaultColors.white,
//                       ),
//                       // Foreground star
//                       Icon(
//                         Icons.star,
//                         size: screenWidth * 0.06,
//                         color: DefaultColors.yellow_0,
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         title: Text(
//           beneficiary.name,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//             color: textColor,
//           ),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               beneficiary.id,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: beneficiary.isDisabled
//                     ? DefaultColors.grayBase
//                     : DefaultColors.grayBase,
//               ),
//             ),
//             Text(
//               beneficiary.bank,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: beneficiary.isDisabled
//                     ? DefaultColors.grayBase
//                     : DefaultColors.grayBase,
//               ),
//             ),
//           ],
//         ),
//         trailing: beneficiary.statusText != null
//             ? Text(
//                 beneficiary.statusText!,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.033,
//                   fontWeight: FontWeight.w500,
//                   color: DefaultColors.grayBase,
//                 ),
//               )
//             : (showActionButton
//                   ? IconButton(
//                       color: DefaultColors.grayTB.withAlpha(170),
//                       onPressed: () {
//                         showModalBottomSheet(
//                           isScrollControlled: true,
//                           context: context,
//                           builder: (context) {
//                             return Expanded(
//                               child: ActionBottomSheet(
//                                 isFavourite: false,
//                                 onToggleFavourite: () {},
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       icon: Icon(Icons.more_vert),
//                     )
//                   : null),
//       ),
//     );
//   }
// }

// og
// class BeneficiaryTile extends StatelessWidget {
//   final Beneficiary beneficiary;
//   final VoidCallback? onTap;
//   final bool showActionButton;

//   const BeneficiaryTile({
//     super.key,
//     required this.beneficiary,
//     this.onTap,
//     this.showActionButton = true,
//   });

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
//           backgroundColor: DefaultColors.blue,
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
//     final textColor = beneficiary.isDisabled
//         ? DefaultColors.grayBase
//         : DefaultColors.black;

//     return ListTile(
//       onTap: beneficiary.isDisabled ? null : onTap,
//       leading: Opacity(
//         opacity: beneficiary.isDisabled ? 0.5 : 1.0,
//         child: Stack(
//           alignment: AlignmentGeometry.bottomCenter,
//           clipBehavior: Clip.none,
//           children: [
//             avatar,
//             if (beneficiary.isFavourite == true)
//               Positioned(
//                 bottom: -10,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     // Background star (border)
//                     Icon(
//                       Icons.star,
//                       size: screenWidth * 0.076,
//                       color: DefaultColors.white,
//                     ),
//                     // Foreground star
//                     Icon(
//                       Icons.star,
//                       size: screenWidth * 0.06,
//                       color: DefaultColors.yellow_0,
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//       title: Text(
//         beneficiary.name,
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//           color: textColor,
//         ),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             beneficiary.id,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: beneficiary.isDisabled
//                   ? DefaultColors.grayBase
//                   : DefaultColors.grayBase,
//             ),
//           ),
//           Text(
//             beneficiary.bank,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: beneficiary.isDisabled
//                   ? DefaultColors.grayBase
//                   : DefaultColors.grayBase,
//             ),
//           ),
//         ],
//       ),
//       trailing: beneficiary.statusText != null
//           ? Text(
//               beneficiary.statusText!,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.033,
//                 fontWeight: FontWeight.w500,
//                 color: DefaultColors.grayBase,
//               ),
//             )
//           : (showActionButton
//                 ? IconButton(
//                     color: DefaultColors.grayTB.withAlpha(170),
//                     onPressed: () {
//                       showModalBottomSheet(
//                         isScrollControlled: true,
//                         context: context,
//                         builder: (context) {
//                           return Expanded(
//                             child: ActionBottomSheet(
//                               isFavourite: false,
//                               onToggleFavourite: () {},
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     icon: Icon(Icons.more_vert),
//                   )
//                 : null),
//     );
//   }
// }
