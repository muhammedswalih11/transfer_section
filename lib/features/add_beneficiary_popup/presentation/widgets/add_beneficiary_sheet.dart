import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import 'beneficiary_acnts_item.dart';

class AddBeneficiaryBottomSheet extends StatelessWidget {
  final Function(String beneficiaryType)? onBeneficiarySelected;

  const AddBeneficiaryBottomSheet({super.key, this.onBeneficiarySelected});

  static final List<Map<String, dynamic>> _beneficiaryTypes = [
    {'name': 'Within Dukhan', 'imagePath': 'assets/images/ico.svg'},
    {'name': 'Within Qatar', 'imagePath': 'assets/images/Flags.svg'},
    {'name': 'International', 'imagePath': 'assets/images/international.svg'},
    {'name': 'Western Union', 'imagePath': 'assets/images/western_union.svg'},
  ];

  static void show(
    BuildContext context, {
    Function(String beneficiaryType)? onBeneficiarySelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddBeneficiaryBottomSheet(
        onBeneficiarySelected: onBeneficiarySelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            width: screenWidth * 0.106,
            height: screenHeight * 0.005,
            decoration: BoxDecoration(
              color: DefaultColors.grayCA,
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add New Beneficiaries',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.blue9D,
                ),
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            itemCount: _beneficiaryTypes.length,
            itemBuilder: (context, index) {
              final beneficiaryType = _beneficiaryTypes[index];
              return BeneficiaryOptionItem(
                name: beneficiaryType['name'] as String,
                imagePath: beneficiaryType['imagePath'] as String,
                onTap: () {
                  if (onBeneficiarySelected != null) {
                    onBeneficiarySelected!(beneficiaryType['name']);
                  }
                },
              );
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
