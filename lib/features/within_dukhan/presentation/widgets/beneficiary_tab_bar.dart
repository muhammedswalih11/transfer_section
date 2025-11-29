import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class BeneficiaryTabBar extends StatelessWidget {
  final int filteredCount;
  final String active;
  final void Function(String) onTabSelected;
  final double height;
  final double cornerRadius;

  const BeneficiaryTabBar({
    super.key,
    required this.filteredCount,
    required this.active,
    required this.onTabSelected,
    required this.height,
    required this.cornerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected('beneficiaries'),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              height: h * 0.060, // ↓ Adjusted height
              decoration: BoxDecoration(
                color: active == 'beneficiaries'
                    ? DefaultColors.blue_300
                    : DefaultColors.blue_100,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              alignment: Alignment.center,
              child: Text(
                'Beneficiaries ($filteredCount)',
                style: TextStyle(
                  color: active == 'beneficiaries'
                      ? DefaultColors.white
                      : DefaultColors.blue9D,
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.035,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected('contacts'),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              height: h * 0.060, // ↓ Adjusted height
              decoration: BoxDecoration(
                color: active == 'contacts'
                    ? DefaultColors.blue_300
                    : DefaultColors.blue_100,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              alignment: Alignment.center,
              child: Text(
                'Contacts (3)',
                style: TextStyle(
                  color: active == 'contacts'
                      ? DefaultColors.white
                      : DefaultColors.blue9D,
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.035,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
