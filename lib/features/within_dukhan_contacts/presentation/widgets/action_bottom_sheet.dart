import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ActionBottomSheet extends StatelessWidget {
  ActionBottomSheet({super.key});

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
            icon: Icons.repeat,
            title: "Standing Order",
            subtitle: "Set up repeated payments",
            onTap: () {},
          ),
          _divider(),

          _actionItem(
            icon: Icons.edit,
            title: "Edit",
            subtitle: "Update beneficiary details",
            onTap: () {},
          ),
          _divider(),

          _actionItem(
            icon: Icons.delete_outline,
            title: "Delete",
            subtitle: "Remove this beneficiary",
            onTap: () {},
          ),
          _divider(),

          _actionItem(
            icon: Icons.star_border,
            title: "Favourite",
            subtitle: "Add as a favourite",
            onTap: () {},
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
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FB),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 22, color: Colors.black87),
          ),
          const SizedBox(width: 15),

          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
