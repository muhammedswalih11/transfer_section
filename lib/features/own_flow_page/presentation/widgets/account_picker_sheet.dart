import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(20),
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
              color: Colors.grey.shade300,
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
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
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 0,
                  ),
                  title: Text(
                    acct['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(acct['accnumber']!),
                  trailing: Text(
                    acct['balance']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
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
