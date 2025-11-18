import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import 'transfer_option_item.dart';

class TransferTypesBottomSheet extends StatelessWidget {
  final Function(String transferType)? onTransferTypeSelected;

  const TransferTypesBottomSheet({super.key, this.onTransferTypeSelected});

  static final List<Map<String, dynamic>> _transferTypes = [
    {'name': 'Within Own Account', 'imagePath': 'assets/images/UserSwitch.svg'},
    {'name': 'Within Dukhan', 'imagePath': 'assets/images/ico.svg'},
    {'name': 'Within Qatar', 'imagePath': 'assets/images/Flags.svg'},
    {
      'name': 'Cardless Withdrawal',
      'imagePath': 'assets/images/creditcard.svg',
    },
    {
      'name': 'International Transfer',
      'imagePath': 'assets/images/international.svg',
    },
    {'name': 'Western Union', 'imagePath': 'assets/images/western_union.svg'},
    {
      'name': 'Schedule Transfer',
      'imagePath': 'assets/images/CalendarDots.svg',
    },
    {'name': 'Transfer history', 'imagePath': 'assets/images/CalendarDots.svg'},
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
    MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.only(top: 12),
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            itemCount: _transferTypes.length,
            itemBuilder: (context, index) {
              final transferType = _transferTypes[index];
              return TransferAccountItem(
                name: transferType['name'] as String,
                imagePath: transferType['imagePath'] as String,
                onTap: () {
                  if (onTransferTypeSelected != null) {
                    onTransferTypeSelected!(transferType['name']);
                  }
                },
              );
            },
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
