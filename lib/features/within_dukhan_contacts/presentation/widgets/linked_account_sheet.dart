import 'package:flutter/material.dart';

class LinkedAccountSheet extends StatelessWidget {
  final void Function(Map<String, String>) onSelected;

  final List<Map<String, String>> accounts = [
    {
      'id': 'primary_2088',
      'title': 'Primary Account',
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

  LinkedAccountSheet({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            height: screenHeight * 0.006,
            width: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(bottom: 12),
          ),

          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select linked bank account",
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.025),

          // Accounts List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: accounts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final acct = accounts[index];

              return InkWell(
                onTap: () => onSelected(acct),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title + number
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              acct['title']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.043,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),
                            Text(
                              acct['accnumber']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Balance
                      Text(
                        acct['balance']!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.037,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
