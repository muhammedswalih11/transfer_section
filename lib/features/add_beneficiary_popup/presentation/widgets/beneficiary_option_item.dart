import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

/// Widget representing a single beneficiary option item
class BeneficiaryOptionItem extends StatelessWidget {
  final String id;
  final String name;
  final String iconPath; // Path to SVG icon (will be used later)
  final VoidCallback onTap;

  const BeneficiaryOptionItem({
    super.key,
    required this.id,
    required this.name,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          children: [
            // Circular icon container (placeholder for SVG)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getIconBackgroundColor(id),
              ),
              child: Center(child: _buildIconPlaceholder(id)),
            ),
            const SizedBox(width: 16),
            // Option text
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.black51,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Gets background color for icon based on beneficiary type
  Color _getIconBackgroundColor(String id) {
    switch (id) {
      case 'within_dukhan':
        return DefaultColors.white_0; // White background for Dukhan logo
      case 'within_qatar':
        return DefaultColors.white_0; // White background for Qatar flag
      case 'international':
        return DefaultColors.white_0; // White background for globe
      case 'western_union':
        return DefaultColors.black; // Black background for Western Union
      default:
        return DefaultColors.grayE5;
    }
  }

  /// Builds icon placeholder (will be replaced with SVG later)
  Widget _buildIconPlaceholder(String id) {
    // Placeholder icons - will be replaced with SVG later
    switch (id) {
      case 'within_dukhan':
        // Dukhan logo placeholder (blue/green split)
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                DefaultColors.blue9D, // Dark blue
                DefaultColors.green_82, // Green
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'D',
              style: TextStyle(
                color: DefaultColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
            margin: const EdgeInsets.only(left: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: DefaultColors.white,
            ),
          ),
        );
      case 'international':
        // Globe placeholder
        return const Icon(Icons.public, color: DefaultColors.blue9D, size: 28);
      case 'western_union':
        // Western Union 'W' placeholder
        return const Text(
          'W',
          style: TextStyle(
            color: Color(0xFFFFC400), // Western Union yellow
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        );
      default:
        return const Icon(Icons.circle, color: DefaultColors.grayE5);
    }
  }
}
