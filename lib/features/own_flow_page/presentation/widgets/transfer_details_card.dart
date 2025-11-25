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

      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: DefaultColors.grayE4, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label("From account"), value(fromAccount)],
            ),
          ),

          divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label("To account"), value(toAccount)],
            ),
          ),

          divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label("Amount"), value(amount)],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label("Remarks"), value(remarks)],
            ),
          ),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: DefaultColors.grayBase,
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

Widget divider() {
  return Container(
    height: 1,
    width: double.infinity,
    color: DefaultColors.grayE4,
  );
}
