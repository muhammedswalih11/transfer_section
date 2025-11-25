import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:transfer_section/core/utils/colors.dart';
import 'package:transfer_section/features/own_flow_page/presentation/widgets/transfer_details_card.dart';

class TransferSuccessPopup extends StatelessWidget {
  final Map<String, String> data;

  const TransferSuccessPopup({super.key, required this.data});

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

          Image.asset('assets/gif/task_success_gif.gif', width: 170),

          const Text(
            "Transfer Successful",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: DefaultColors.black,
            ),
          ),
          Text(
            _formattedDateTime(),
            style: const TextStyle(
              fontSize: 14,
              color: DefaultColors.grayBase,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 20),

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
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("From account"),
                      _value(data["fromAccount"]!),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("To account"),
                      _value(data["toAccount"]!),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Amount"),
                      _value("${data["amount"]!} QAR"),
                    ],
                  ),
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Reference number"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _value(data["reference"]!),
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
                            child: const Icon(
                              Icons.copy,
                              size: 20,
                              color: DefaultColors.blue,
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
                    children: [_label("Remarks"), _value(data["remarks"]!)],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/Vector.svg',
                width: 20,
                color: DefaultColors.blue,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Share',
                  style: TextStyle(color: DefaultColors.blue, fontSize: 18),
                ),
              ),
            ],
          ),

          SizedBox(
            width: screenWidth,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: DefaultColors.dashboarddarkBlue,

                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Done",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      color: DefaultColors.grayBase,
      fontWeight: FontWeight.w500,
    ),
  );

  Widget _value(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: DefaultColors.black,
    ),
  );
}

String _formattedDateTime() {
  final now = DateTime.now();
  final formatter = DateFormat("d MMMM yyyy . h:mma");
  return formatter.format(now).replaceAll("AM", "AM").replaceAll("PM", "PM");
}
