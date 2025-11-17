import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';

/// Widget representing a single beneficiary option item
class BeneficiaryOptionItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const BeneficiaryOptionItem({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: DefaultColors.grayE5,
            child: SvgPicture.asset(imagePath, width: 24, height: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: DefaultColors.black51,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
