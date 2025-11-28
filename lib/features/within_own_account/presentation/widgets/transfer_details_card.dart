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
    final screenHeight = mediaQuery.size.height;
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
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("From account", context),
                value(fromAccount, context),
              ],
            ),
          ),

          divider(),

          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("To account", context),
                value(toAccount, context),
              ],
            ),
          ),

          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Amount", context),
                value("$amount QAR", context),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label("Remarks", context), value(remarks, context)],
            ),
          ),
        ],
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

Widget label(String text, BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;

  return Text(
    text,
    style: TextStyle(
      fontSize: screenWidth * 0.035,
      color: DefaultColors.grayMedBase,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget value(String text, BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;

  return Text(
    text,
    style: TextStyle(
      fontSize: screenWidth * 0.037,
      fontWeight: FontWeight.w500,
      color: DefaultColors.black,
    ),
  );
}
