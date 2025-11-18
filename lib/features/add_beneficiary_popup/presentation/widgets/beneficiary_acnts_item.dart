import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';

class BeneficiaryOptionItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback? onTap;

  const BeneficiaryOptionItem({
    super.key,
    required this.name,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: DefaultColors.blue_0,
              child: SvgPicture.asset(imagePath, width: 26, height: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
