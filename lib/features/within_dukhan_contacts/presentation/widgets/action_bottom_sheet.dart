import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ActionBottomSheet extends StatelessWidget {
  final bool isFavourite;
  final VoidCallback onToggleFavourite;

  const ActionBottomSheet({
    super.key,
    required this.isFavourite,
    required this.onToggleFavourite,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.012,
        left: screenWidth * 0.04,
        right: screenWidth * 0.04,
        bottom: screenHeight * 0.03,
      ),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
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
            margin: EdgeInsets.only(bottom: 14),
          ),
          SizedBox(height: screenHeight * 0.01),

          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select an action",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w700,
                color: DefaultColors.black,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Items
          _actionItem(
            context: context,
            icon: Icons.repeat,
            title: "Standing Order",
            subtitle: "Set up repeated payments",
            onTap: () {},
          ),
          _divider(),

          _actionItem(
            context: context,
            icon: Icons.edit_outlined,
            title: "Edit",
            subtitle: "Update beneficiary details",
            onTap: () {},
          ),
          _divider(),

          _actionItem(
            context: context,
            icon: Icons.delete_outline,
            title: "Delete",
            subtitle: "Remove this beneficiary",
            onTap: () {},
          ),
          _divider(),

          _actionItem(
            context: context,
            icon: isFavourite ? Icons.star : Icons.star_border,
            title: isFavourite ? "Remove from Favourite" : "Favourite",
            subtitle: isFavourite
                ? "Remove from favourite list"
                : "Add as a favourite",
            onTap: () {
              Navigator.pop(context);
              onToggleFavourite();
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(height: 1, color: Color(0xFFE6E6E6)),
    );
  }

  Widget _actionItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle icon
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              color: DefaultColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: screenWidth * 0.06, color: Colors.black87),
          ),
          SizedBox(width: screenWidth * 0.04),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.044,
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.003),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: screenWidth * 0.033,
                  color: DefaultColors.grayBase,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
