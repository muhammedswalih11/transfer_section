import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/colors.dart';
import '../../../within_own_account/presentation/widgets/image_converter.dart';
import '../../../within_own_account/presentation/widgets/image_sharing_sheet.dart';
import '../../../within_own_account/presentation/widgets/share_action_row.dart';
import '../../../within_own_account/presentation/widgets/share_as_popup.dart';
import '../../../within_own_account/presentation/widgets/transfer_details_card.dart';
import '../../../within_own_account/presentation/widgets/universal_pdf.dart';

class WithinDukhanSucces extends StatelessWidget {
  final Map<String, String> data;
  const WithinDukhanSucces({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: DefaultColors.white,
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
            margin: EdgeInsets.only(bottom: 14),
          ),
          SizedBox(height: screenHeight * 0.01),
          Image.asset(
            'assets/gif/task_success_gif.gif',
            width: screenWidth * 0.25,
          ),

          Text(
            "Transfer Successful",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: DefaultColors.black,
            ),
          ),
          Text(
            _formattedDateTime(),
            style: const TextStyle(
              fontSize: 14,
              color: DefaultColors.grayMedBase,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          Container(
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
                    right: screenWidth * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("From Account", context),
                      value(data["fromAccount"]!, context),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.012,
                    right: screenWidth * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("To Beneficiary/Contact", context),
                      value(data["toBeneficiaryContact"]!, context),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.012,
                    right: screenWidth * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("Total Debit Amount", context),
                      value(
                        "${data["totalAmount"]!} QAR (includes ${data["fee"]} QAR fees)",
                        context,
                      ),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.012,
                    right: screenWidth * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("Reference Number", context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          value(data["reference"]!, context),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(text: data["reference"]!),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Copied to clipboard",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  duration: Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(16),
                                ),
                              );
                            },
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(3.14159),
                              child: Icon(
                                Icons.copy_sharp,

                                size: 20,
                                color: DefaultColors.flatblue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("Purpose of Transfer", context),
                      value(data["purpose"]!, context),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("Remarks", context),
                      value(data["remarks"]!, context),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShareActionRow(
                text: 'Share as Pdf',
                onTap: () async {
                  final pdfFile = await generateReceiptPdf(
                    headerTitle: "Within Dukhan Transfer Receipt",
                    dateTime: _formattedDateTime(),
                    sections: [
                      PdfSection("From Account", data["fromAccount"]!),
                      PdfSection(
                        "To Beneficiary/Contact",
                        data["toBeneficiaryContact"]!,
                      ),
                      PdfSection(
                        "Total Debit Amount",
                        "${data["totalAmount"]} QAR (includes ${data["fee"]} QAR fees)",
                      ),
                      PdfSection("Reference Number", data["reference"]!),
                      PdfSection("Purpose of Transfer", data["purpose"]!),
                      PdfSection("Remarks", data["remarks"] ?? "-"),
                    ],
                    fileName: "within_dukhan_receipt.pdf",
                  );

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text("PDF created: ${pdfFile.path}")),
                  // );
                },
              ),
              SizedBox(width: screenWidth * 0.15),
              ShareActionRow(
                text: "Share as Image",
                onTap: () {
                  ShareOptionsImageSheet.show(
                    context: context,
                    onGenerateImage: () async {
                      final pdf = await generateReceiptPdf(
                        headerTitle: "Transfer Receipt",
                        dateTime: _formattedDateTime(),
                        sections: [
                          PdfSection("From Account", data["fromAccount"]!),
                          PdfSection(
                            "To Beneficiary/Contact",
                            data["toBeneficiaryContact"]!,
                          ),
                          PdfSection(
                            "Total Debit Amount",
                            "${data["totalAmount"]} QAR (includes ${data["fee"]} QAR fees)",
                          ),
                          PdfSection("Reference Number", data["reference"]!),
                          PdfSection("Purpose of Transfer", data["purpose"]!),
                          PdfSection("Remarks", data["remarks"] ?? "-"),
                        ],
                      );

                      return convertPdfToImage(pdf);
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: screenWidth,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: DefaultColors.dashboarddarkBlue,

                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.013),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: screenWidth * 0.043,
                  fontWeight: FontWeight.w400,
                  color: DefaultColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }
}

String _formattedDateTime() {
  final now = DateTime.now();
  final formatter = DateFormat("d MMMM yyyy . h:mma");
  return formatter.format(now).replaceAll("AM", "AM").replaceAll("PM", "PM");
}
