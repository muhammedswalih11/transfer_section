import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import 'transfer_option_item.dart';

class TransferTypesBottomSheet extends StatelessWidget {
  final Function(String transferType)? onTransferTypeSelected;

  const TransferTypesBottomSheet({super.key, this.onTransferTypeSelected});

  static final List<Map<String, dynamic>> _transferTypes = [
    {
      'id': 'within_own_account',
      'name': 'Within Own Account',
      'iconPath': 'assets/icons/own_account.svg',
    },
    {
      'id': 'within_dukhan',
      'name': 'Within Dukhan',
      'iconPath': 'assets/icons/dukhan.svg',
    },
    {
      'id': 'within_qatar',
      'name': 'Within Qatar',
      'iconPath': 'assets/icons/qatar_flag.svg',
    },
    {
      'id': 'cardless_withdrawal',
      'name': 'Cardless Withdrawal',
      'iconPath': 'assets/icons/cardless.svg',
    },
    {
      'id': 'international_transfer',
      'name': 'International Transfer',
      'iconPath': 'assets/icons/globe.svg',
    },
    {
      'id': 'western_union',
      'name': 'Western Union',
      'iconPath': 'assets/icons/western_union.svg',
    },
    {
      'id': 'schedule_transfer',
      'name': 'Schedule Transfer',
      'iconPath': 'assets/icons/schedule.svg',
    },
    {
      'id': 'transfer_history',
      'name': 'Transfer history',
      'iconPath': 'assets/icons/history.svg',
    },
  ];

  static void show(
    BuildContext context, {
    Function(String transferType)? onTransferTypeSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TransferTypesBottomSheet(
        onTransferTypeSelected: onTransferTypeSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Dynamic sizes based on screen size
    final borderRadius = screenWidth * 0.05; // 5% of screen width
    final horizontalPadding = screenWidth * 0.05; // 5% of screen width
    final titleFontSize = screenWidth * 0.056; // ~22px on standard screen
    final dragHandleWidth = screenWidth * 0.106; // ~40px on standard screen
    final dragHandleHeight = screenHeight * 0.005; // ~4px on standard screen

    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: screenHeight * 0.01),
          // Transfer options list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: screenHeight * 0.01,
            ),
            itemCount: _transferTypes.length,
            itemBuilder: (context, index) {
              final transferType = _transferTypes[index];
              return TransferOptionItem(
                id: transferType['id'] as String,
                name: transferType['name'] as String,
                iconPath: transferType['iconPath'] as String,
                onTap: () {
                  Navigator.of(context).pop();
                  onTransferTypeSelected?.call(transferType['id'] as String);
                },
              );
            },
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
