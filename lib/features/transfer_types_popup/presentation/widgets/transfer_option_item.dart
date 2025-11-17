import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

/// Widget representing a single transfer option item
class TransferOptionItem extends StatelessWidget {
  final String id;
  final String name;
  final String iconPath; // Path to SVG icon (will be used later)
  final VoidCallback onTap;

  const TransferOptionItem({
    super.key,
    required this.id,
    required this.name,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Dynamic sizes based on screen size
    final iconSize = screenWidth * 0.128; // ~48px on standard screen
    final itemPadding = screenHeight * 0.02; // ~16px on standard screen
    final horizontalSpacing = screenWidth * 0.042; // ~16px on standard screen
    final textFontSize = screenWidth * 0.042; // ~16px on standard screen

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: itemPadding,
          horizontal: screenWidth * 0.01,
        ),
        child: Row(
          children: [
            // Circular icon container (placeholder for SVG)
            Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getIconBackgroundColor(id),
              ),
              child: Center(child: _buildIconPlaceholder(id, iconSize)),
            ),
            SizedBox(width: horizontalSpacing),
            // Option text
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: textFontSize,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.black51,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Gets background color for icon based on transfer type
  Color _getIconBackgroundColor(String id) {
    switch (id) {
      case 'within_own_account':
        return const Color(0xFFE8F5F9); // Light blue background
      case 'within_dukhan':
        return DefaultColors.white_0; // White background
      case 'within_qatar':
        return DefaultColors.white_0; // White background
      case 'cardless_withdrawal':
        return const Color(0xFFE8F5F9); // Light blue background
      case 'international_transfer':
        return const Color(0xFFE8F5F9); // Light blue background
      case 'western_union':
        return DefaultColors.black; // Black background
      case 'schedule_transfer':
        return const Color(0xFFE8F5F9); // Light blue background
      case 'transfer_history':
        return const Color(0xFFE8F5F9); // Light blue background
      default:
        return DefaultColors.grayE5;
    }
  }

  /// Builds icon placeholder (will be replaced with SVG later)
  Widget _buildIconPlaceholder(String id, double iconSize) {
    final iconInnerSize = iconSize * 0.6; // 60% of icon size

    switch (id) {
      case 'within_own_account':
        // Circular loop arrows icon placeholder
        return Icon(
          Icons.sync,
          color: DefaultColors.blue9D,
          size: iconInnerSize,
        );
      case 'within_dukhan':
        // Dukhan logo placeholder (blue/green split)
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [DefaultColors.blue9D, DefaultColors.green_82],
            ),
          ),
          child: Center(
            child: Text(
              'D',
              style: TextStyle(
                color: DefaultColors.white,
                fontWeight: FontWeight.bold,
                fontSize: iconSize * 0.42,
              ),
            ),
          ),
        );
      case 'within_qatar':
        // Qatar flag placeholder (maroon with white serrated stripe)
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF8B1538), // Qatar maroon
          ),
          child: Container(
            margin: EdgeInsets.only(left: iconSize * 0.167),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: DefaultColors.white,
            ),
          ),
        );
      case 'cardless_withdrawal':
        // Credit card with diagonal line placeholder
        return Icon(
          Icons.credit_card_off,
          color: DefaultColors.blue9D,
          size: iconInnerSize,
        );
      case 'international_transfer':
        // Globe placeholder
        return Icon(
          Icons.public,
          color: DefaultColors.blue9D,
          size: iconInnerSize,
        );
      case 'western_union':
        // Western Union 'W' placeholder
        return Text(
          'W',
          style: TextStyle(
            color: const Color(0xFFFFC400), // Western Union yellow
            fontWeight: FontWeight.bold,
            fontSize: iconSize * 0.5,
          ),
        );
      case 'schedule_transfer':
        // Calendar icon placeholder
        return Icon(
          Icons.calendar_today,
          color: DefaultColors.blue9D,
          size: iconInnerSize,
        );
      case 'transfer_history':
        // Calendar/history icon placeholder
        return Icon(
          Icons.history,
          color: DefaultColors.blue9D,
          size: iconInnerSize,
        );
      default:
        return Icon(
          Icons.circle,
          color: DefaultColors.grayE5,
          size: iconInnerSize,
        );
    }
  }
}
