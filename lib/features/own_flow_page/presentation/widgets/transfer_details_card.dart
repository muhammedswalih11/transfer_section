import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class TransferDetailsCard extends StatelessWidget {
  final String fromAccount;
  final String toAccount;
  final String amount;
  final String remarks;
  const TransferDetailsCard({
    super.key,
    required this.fromAccount,
    required this.toAccount,
    required this.amount,
    required this.remarks,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DefaultColors.blue03,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label("From account"),
          value(fromAccount),
          const SizedBox(height: 24),

          label("To account"),
          value(toAccount),
          const SizedBox(height: 24),
          label("Amount"),
          value(amount),
          const SizedBox(height: 24),

          label("Remarks"),
          value(remarks),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: DefaultColors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget value(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: DefaultColors.black,
      ),
    );
  }
}
