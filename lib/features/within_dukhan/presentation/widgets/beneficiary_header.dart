import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class BeneficiaryHeader extends StatelessWidget {
  final double handleWidth;
  const BeneficiaryHeader({super.key, required this.handleWidth});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: handleWidth,
            height: 4,
            decoration: BoxDecoration(
              color: DefaultColors.grayE6,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Select Beneficiary/Contact',
          style: TextStyle(
            fontSize: w * 0.050,
            fontWeight: FontWeight.w600,
            color: DefaultColors.black24,
          ),
        ),
      ],
    );
  }
}
