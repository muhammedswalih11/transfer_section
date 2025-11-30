import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'linked_account_sheet.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

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
          // Sheet handle
          Container(
            width: screenWidth * 0.12,
            height: screenHeight * 0.006,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Settings",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Blue Highlight Box
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F2FD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.radio_button_checked,
                  color: const Color(0xFF0A5BE0),
                  size: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Visible to Friends",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "You will be displayed in the friends list of all Dukhan "
                        "Bank customers who saves your number in their contact list",
                        style: TextStyle(
                          fontSize: screenWidth * 0.034,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // Linked Bank Account Label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Linked Bank Account",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),

          // White Account Box
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Account texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Primary Account",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.004),
                      Text(
                        "ABDUL MOHAMMED\n1234567890",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: screenWidth * 0.034,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Pen edit icon
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(22),
                        ),
                      ),
                      builder: (_) => LinkedAccountSheet(
                        onSelected: (account) {
                          // You will receive selected account map here
                          Navigator.pop(context); // close sheet

                          // TODO: handle the selected account
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.edit_outlined,
                    size: screenWidth * 0.05,
                    color: DefaultColors.flatblue,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.3),

          // Save Button
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.065,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: DefaultColors.dashboarddarkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
