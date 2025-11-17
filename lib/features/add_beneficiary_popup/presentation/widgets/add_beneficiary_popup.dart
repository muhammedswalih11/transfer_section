import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import 'beneficiary_option_item.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: DefaultColors.grayCA,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add New Beneficiaries',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.blue9D,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Beneficiary options list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            itemCount: _beneficiaryTypes.length,
            itemBuilder: (context, index) {
              final beneficiaryType = _beneficiaryTypes[index];
              return BeneficiaryOptionItem(
                name: beneficiaryType['name'] as String,
                imagePath: beneficiaryType['imagePath'] as String,
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
