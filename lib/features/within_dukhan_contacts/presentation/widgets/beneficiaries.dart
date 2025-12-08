import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transfer_section/features/within_dukhan_contacts/presentation/data/beneficiary_model.dart';
import 'package:transfer_section/features/within_dukhan_contacts/presentation/widgets/beneficiaries_corrupted.dart';

import '../../../../core/utils/colors.dart';
import 'action_bottom_sheet.dart';

// class Beneficiaries extends ConsumerWidget {
//   final List display;
//   final double iconSize;
//   final void Function(dynamic item)? onActionTap;

//   const Beneficiaries({
//     super.key,
//     required this.display,
//     required this.iconSize,
//     this.onActionTap,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: display.length,
//         itemBuilder: (_, i) {
//           final item = display[i];

//           return Column(
//             children: [
//               InkWell(
//                 onTap: () => Navigator.pop(context, item),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 10,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildAvatar(item, h, w, i == 0),

//                       SizedBox(width: w * 0.03),

//                       /// MAIN TEXT SECTION
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               item.name,
//                               style: TextStyle(
//                                 fontSize: w * 0.040,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               item.accNumber,
//                               style: TextStyle(
//                                 fontSize: w * 0.035,
//                                 color: DefaultColors.black,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(height: 2),
//                             Text(
//                               item.sub,
//                               style: TextStyle(
//                                 fontSize: w * 0.030,
//                                 color: DefaultColors.gray82,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       /// Action menu for all items
//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(24),
//                               ),
//                             ),
//                             builder: (_) => ActionBottomSheet(),
//                           );
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.only(top: h * 0.02),
//                           child: Icon(
//                             Icons.more_vert,
//                             color: DefaultColors.gray82,
//                             size: w * 0.05,
//                           ),
//                         ),
//                       ),

//                       /// Special action icons for Sara Rahman
//                       if (item.name.toLowerCase().contains('sara rahman')) ...[
//                         SizedBox(width: w * 0.04),

//                         /// Red delete icon
//                         Padding(
//                           padding: EdgeInsets.only(top: h * 0.01),
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   // Handle delete action
//                                   print('Delete tapped for ${item.name}');
//                                 },
//                                 child: Container(
//                                   width: w * 0.10,
//                                   height: w * 0.10,
//                                   decoration: BoxDecoration(
//                                     color: DefaultColors.redC2,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     Icons.delete_outline_outlined,
//                                     color: Colors.red,
//                                     size: w * 0.06,
//                                   ),
//                                 ),
//                               ),

//                               SizedBox(width: w * 0.04),

//                               /// Blue favorite icon
//                               GestureDetector(
//                                 onTap: () {
//                                   // Handle favorite action
//                                   print('Favorite tapped for ${item.name}');
//                                 },
//                                 child: Container(
//                                   width: w * 0.10,
//                                   height: w * 0.10,
//                                   decoration: BoxDecoration(
//                                     color: DefaultColors.blue04,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     Icons.star_border,
//                                     color: DefaultColors.black,
//                                     size: w * 0.06,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//               // Add divider after each item (including the last one)
//               if (i < display.length - 1)
//                 Divider(
//                   height: 1,
//                   color: DefaultColors.grayTB.withAlpha(51),
//                   indent: 16,
//                   endIndent: 16,
//                 ),
//               // Add bottom border for the last item
//               if (i == display.length - 1)
//                 Container(
//                   height: 1,
//                   margin: EdgeInsets.symmetric(horizontal: 16),
//                   color: DefaultColors.grayTB.withAlpha(51),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   /// Avatar Builder
//   Widget _buildAvatar(dynamic item, double h, double w, bool hasProfileImage) {
//     // Check if this is specifically Aliya Khan to show SVG
//     if (item.name.toLowerCase().contains('aliya khan')) {
//       return CircleAvatar(
//         radius: h * 0.03,
//         backgroundColor: Colors.transparent,
//         child: ClipOval(
//           child: SvgPicture.asset(
//             'assets/images/Avatars.svg',
//             width: h * 0.06,
//             height: h * 0.06,
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
//     }

//     final initials = _getInitials(item.name);

//     return CircleAvatar(
//       radius: h * 0.03,
//       backgroundColor: DefaultColors.blueFA,
//       child: Text(
//         initials,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: DefaultColors.blue9D,
//           fontSize: w * 0.035,
//         ),
//       ),
//     );
//   }

//   String _getInitials(String name) {
//     final parts = name.split(" ");
//     if (parts.length == 1) return parts[0][0].toUpperCase();
//     return (parts[0][0] + parts[1][0]).toUpperCase();
//   }
// }

class BeneficiaryTile extends StatelessWidget {
  final Beneficiary beneficiary;
  final VoidCallback? onToggleFavourite;
  final bool showActionButton;
  final VoidCallback? onTap;

  const BeneficiaryTile({
    super.key,
    required this.beneficiary,
    this.onToggleFavourite,
    this.showActionButton = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    /// Build avatar widget
    final Widget avatar;
    if (beneficiary.avatarUrl != null && beneficiary.avatarUrl!.isNotEmpty) {
      avatar = CircleAvatar(
        radius: screenWidth * 0.064,
        backgroundImage: NetworkImage(beneficiary.avatarUrl!),
      );
    } else if (beneficiary.localImage != null &&
        beneficiary.localImage!.isNotEmpty) {
      if (beneficiary.localImage!.toLowerCase().endsWith('.svg')) {
        avatar = CircleAvatar(
          radius: screenWidth * 0.064,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: SvgPicture.asset(
              beneficiary.localImage!,
              width: screenWidth * 0.128,
              height: screenWidth * 0.128,
              fit: BoxFit.cover,
            ),
          ),
        );
      } else {
        avatar = CircleAvatar(
          radius: screenWidth * 0.064,
          backgroundImage: AssetImage(beneficiary.localImage!),
          onBackgroundImageError: (exception, stackTrace) {
            debugPrint('Error loading image: $exception');
          },
        );
      }
    } else {
      // Show initials when no image provided
      final initials = beneficiary.name.trim().isNotEmpty
          ? beneficiary.name
                .trim()
                .split(' ')
                .map((e) => e.isNotEmpty ? e[0] : '')
                .take(2)
                .join()
          : '';

      avatar = CircleAvatar(
        backgroundColor: DefaultColors.white,
        radius: screenWidth * 0.064,
        child: CircleAvatar(
          radius: screenWidth * 0.06,
          backgroundColor: DefaultColors.blue03,
          child: Text(
            initials,
            style: TextStyle(
              color: DefaultColors.black,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      );
    }

    /// Return ListTile for ALL cases
    final textColor = beneficiary.isDisabled
        ? DefaultColors.grayBase
        : DefaultColors.black;

    return Slidable(
      enabled: showActionButton && !beneficiary.isDisabled,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.4,
        children: [
          CustomSlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            child: Container(
              width: 1,
              height: double.infinity,
              color: DefaultColors.grayE6,
            ),
            autoClose: false,
          ),
          CustomSlidableAction(
            onPressed: (context) {
              if (onToggleFavourite != null) onToggleFavourite!();
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            child: Container(
              width: screenWidth * 0.10,
              height: screenWidth * 0.10,
              decoration: BoxDecoration(
                color: DefaultColors.blue04,
                shape: BoxShape.circle,
              ),
              child: Icon(
                beneficiary.isFavourite == true
                    ? Icons.star
                    : Icons.star_border,
                color: DefaultColors.black,
                size: screenWidth * 0.05,
              ),
            ),
          ),
          CustomSlidableAction(
            onPressed: (context) {
              // Delete action
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            child: Container(
              width: screenWidth * 0.10,
              height: screenWidth * 0.10,
              decoration: BoxDecoration(
                color: DefaultColors.redC2,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: screenWidth * 0.05,
              ),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: ListTile(
          onTap: beneficiary.isDisabled ? null : onTap,
          leading: Opacity(
            opacity: beneficiary.isDisabled ? 0.5 : 1.0,
            child: Stack(
              alignment: AlignmentGeometry.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                avatar,
                if (beneficiary.isFavourite == true)
                  Positioned(
                    bottom: -10,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background star (border)
                        Icon(
                          Icons.star,
                          size: screenWidth * 0.076,
                          color: DefaultColors.white,
                        ),
                        // Foreground star
                        Icon(
                          Icons.star,
                          size: screenWidth * 0.06,
                          color: DefaultColors.yellow_0,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          title: Text(
            beneficiary.name,
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                beneficiary.id,
                style: TextStyle(
                  fontSize: screenWidth * 0.030,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.grayBase,
                ),
              ),
              Text(
                beneficiary.bank,
                style: TextStyle(
                  fontSize: screenWidth * 0.026,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.grayBase,
                ),
              ),
            ],
          ),
          contentPadding: EdgeInsets.only(
            left: screenWidth * 0.036,
            right: showActionButton ? 0 : screenWidth * 0.036,
          ),
          trailing: beneficiary.statusText != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * 0.036,
                    top: screenHeight * 0.012,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Active in',
                        style: TextStyle(
                          fontSize: screenWidth * 0.028,
                          fontWeight: FontWeight.w500,
                          color: DefaultColors.grayBase,
                        ),
                      ),
                      Text(
                        beneficiary.statusText!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.028,
                          fontWeight: FontWeight.w500,
                          color: DefaultColors.grayBase,
                        ),
                      ),
                    ],
                  ),
                )
              : (showActionButton
                    ? IconButton(
                        color: DefaultColors.grayTB.withAlpha(170),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (_) => ActionBottomSheet(
                              isFavourite: beneficiary.isFavourite ?? false,
                              onToggleFavourite: onToggleFavourite ?? () {},
                            ),
                          );
                        },
                        icon: Icon(Icons.more_vert),
                      )
                    : null),
        ),
      ),
    );
  }
}
