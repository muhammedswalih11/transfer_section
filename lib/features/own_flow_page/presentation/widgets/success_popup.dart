import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:transfer_section/core/utils/colors.dart';

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
              color: DefaultColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: DefaultColors.blue03,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _label("From account"),
                _value(data["fromAccount"]!),
                SizedBox(height: 24),

                _label("To account"),
                _value(data["toAccount"]!),
                SizedBox(height: 24),
                _label("Amount"),
                _value("${data["amount"]!} QAR"),
                SizedBox(height: 24),

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
                            content: Text("Copied to clipboard"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: const Icon(Icons.copy, size: 20),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                _label("Remarks"),
                _value(data["remarks"]!),
              ],
            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Vector.svg', width: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Share',
                  style: TextStyle(
                    color: DefaultColors.blue_150_db,
                    fontSize: 18,
                  ),
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
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      color: DefaultColors.black,
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
