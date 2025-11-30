import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/colors.dart';

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

    return ListView.separated(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: display.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: DefaultColors.grayE6),
      itemBuilder: (_, i) {
        final item = display[i];

        final bool isFirst = i == 0; // Aliya Khan
        final bool showInlineActions = i == 1; // Athiyat

        return InkWell(
          onTap: () => Navigator.pop(context, item),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatar(item, h, w, isFirst),

                SizedBox(width: w * 0.03),

                /// MAIN TEXT SECTION
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: w * 0.040,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          /// three-dot action button for all except 2nd item
                          if (!showInlineActions)
                            GestureDetector(
                              onTap: () => onActionTap?.call(item),
                              child: Icon(
                                Icons.more_vert,
                                color: DefaultColors.gray82,
                              ),
                            ),
                        ],
                      ),

                      if (isFirst)
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              SizedBox(width: 5),
                              Text(
                                "Favourite",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: w * 0.030,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                      SizedBox(height: 6),
                      Text(
                        item.accNumber ?? "44920237",
                        style: TextStyle(
                          fontSize: w * 0.030,
                          color: DefaultColors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item.sub,
                        style: TextStyle(
                          fontSize: w * 0.030,
                          color: DefaultColors.gray82,
                        ),
                      ),

                      /// Inline delete + favourite icons for 2nd item
                      if (showInlineActions)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.star_border,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Avatar Builder
  Widget _buildAvatar(dynamic item, double h, double w, bool isFirst) {
    if (isFirst) {
      return CircleAvatar(
        radius: h * 0.03,
        backgroundImage: AssetImage('assets/images/sara.png'),
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
