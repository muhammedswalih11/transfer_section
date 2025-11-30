import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';
import 'action_bottom_sheet.dart';

class Beneficiaries extends ConsumerWidget {
  final List display;
  final double iconSize;
  final void Function(dynamic item)? onActionTap;

  const Beneficiaries({
    super.key,
    required this.display,
    required this.iconSize,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: display.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: DefaultColors.grayTB.withAlpha(51),
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (_, i) {
          final item = display[i];

          return InkWell(
            onTap: () => Navigator.pop(context, item),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(item, h, w, i == 0),

                  SizedBox(width: w * 0.03),

                  /// MAIN TEXT SECTION
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: w * 0.040,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.accNumber,
                          style: TextStyle(
                            fontSize: w * 0.035,
                            color: DefaultColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          item.sub,
                          style: TextStyle(
                            fontSize: w * 0.030,
                            color: DefaultColors.gray82,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Action menu for all items
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        builder: (_) => ActionBottomSheet(),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: h * 0.02),
                      child: Icon(
                        Icons.more_vert,
                        color: DefaultColors.gray82,
                        size: w * 0.05,
                      ),
                    ),
                  ),

                  /// Special action icons for Sara Rahman
                  if (item.name.toLowerCase().contains('sara rahman')) ...[
                    SizedBox(width: w * 0.04),

                    /// Red delete icon
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.01),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle delete action
                              print('Delete tapped for ${item.name}');
                            },
                            child: Container(
                              width: w * 0.10,
                              height: w * 0.10,
                              decoration: BoxDecoration(
                                color: DefaultColors.redC2,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.red,
                                size: w * 0.06,
                              ),
                            ),
                          ),

                          SizedBox(width: w * 0.04),

                          /// Blue favorite icon
                          GestureDetector(
                            onTap: () {
                              // Handle favorite action
                              print('Favorite tapped for ${item.name}');
                            },
                            child: Container(
                              width: w * 0.10,
                              height: w * 0.10,
                              decoration: BoxDecoration(
                                color: DefaultColors.blue04,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.star_border,
                                color: DefaultColors.black,
                                size: w * 0.06,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Avatar Builder
  Widget _buildAvatar(dynamic item, double h, double w, bool hasProfileImage) {
    // Check if this is specifically Aliya Khan to show SVG
    if (item.name.toLowerCase().contains('aliya khan')) {
      return CircleAvatar(
        radius: h * 0.03,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: SvgPicture.asset(
            'assets/images/Avatars.svg',
            width: h * 0.06,
            height: h * 0.06,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    final initials = _getInitials(item.name);

    return CircleAvatar(
      radius: h * 0.03,
      backgroundColor: DefaultColors.blueFA,
      child: Text(
        initials,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: DefaultColors.blue9D,
          fontSize: w * 0.035,
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.split(" ");
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}
