import 'package:flutter/material.dart';

class LimitsBottomSheet extends StatelessWidget {
  const LimitsBottomSheet({super.key});

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
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Limits",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 25),

                Text(
                  "Minimum amount per transaction",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                SizedBox(height: 6),
                Text(
                  "0.01 QAR",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 20),
                Divider(color: Colors.grey),

                SizedBox(height: 20),

                Text(
                  "Maximum amount per transaction",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                SizedBox(height: 6),
                Text(
                  "100,000.00 QAR",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
