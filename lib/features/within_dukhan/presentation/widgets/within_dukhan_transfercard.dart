import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../within_own_account/presentation/widgets/transfer_details_card.dart';

class WithinDukhanTransfercard extends StatelessWidget {
  final String fromAccount;
  final String toBenificiaryContact;
  final String totalAmount;
  final String purposeofTransfer;
  final String remarks;
  final double fee;
  const WithinDukhanTransfercard({
    super.key,
    required this.fromAccount,
    required this.toBenificiaryContact,
    required this.totalAmount,
    required this.purposeofTransfer,
    required this.remarks,
    required this.fee,
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
                label("To Beneficiary/Contact", context),
                value(toBenificiaryContact, context),
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
                label("Total Debit Amount", context),
                value("$totalAmount QAR (includes ${fee} QAR fees)", context),
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
                label("Purpose of Transfer", context),
                value(purposeofTransfer, context),
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
