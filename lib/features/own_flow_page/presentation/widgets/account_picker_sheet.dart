import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class AccountPickerSheet extends StatelessWidget {
  final String? disabledAccountId;
  final String title;
  final String subtitle;
  final void Function(Map<String, String>) onSelected;

  final List<Map<String, String>> accounts = [
    {
      'id': 'savings_2088',
      'title': 'Savings Account',
      'accnumber': 'xxxx2088',
      'balance': '889,200.00 QAR',
    },
    {
      'id': 'current_6238',
      'title': 'Current Account',
      'accnumber': 'xxxx6238',
      'balance': '7,540.00 QAR',
    },
  ];
  AccountPickerSheet({
    super.key,
    required this.disabledAccountId,
    required this.title,
    required this.subtitle,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: screenHeight * 0.006,
            width: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: DefaultColors.graylight,
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(bottom: 14),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: DefaultColors.grayMedBase,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ListView.separated(
            shrinkWrap: true,
            itemCount: accounts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final acct = accounts[index];
              final id = acct['id']!;
              final disabled = (id == disabledAccountId);
              return Opacity(
                opacity: disabled ? 0.45 : 1.0,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.012,
                    horizontal: 0,
                  ),
                  title: Text(
                    acct['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.040,
                      color: DefaultColors.black,
                    ),
                  ),
                  subtitle: Text(
                    acct['accnumber']!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.034,
                      color: DefaultColors.grayMedBase,
                    ),
                  ),
                  trailing: Text(
                    acct['balance']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                      color: DefaultColors.black,
                    ),
                  ),
                  onTap: disabled ? null : () => onSelected(acct),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
