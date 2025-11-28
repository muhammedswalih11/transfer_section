import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:transfer_section/core/utils/colors.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/share_as_popup.dart';
import 'package:transfer_section/features/within_own_account/presentation/widgets/transfer_details_card.dart';

class TransferSuccessPopup extends StatelessWidget {
  final Map<String, String> data;

  const TransferSuccessPopup({super.key, required this.data});

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
          Image.asset('assets/gif/task_success_gif.gif', width: 140),

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
                      label("From account", context),
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
                      label("To account", context),
                      value(data["toAccount"]!, context),
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
                      label("Amount", context),
                      value("${data["amount"]!} QAR", context),
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
                      label("Reference number", context),
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
              SvgPicture.asset(
                'assets/images/Vector.svg',
                width: 16,
                color: DefaultColors.flatblue,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ShareAsPopup(),
                      );
                    },
                  );
                },
                child: Text(
                  'Share Transfer Details',
                  style: TextStyle(color: DefaultColors.flatblue, fontSize: 18),
                ),
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
