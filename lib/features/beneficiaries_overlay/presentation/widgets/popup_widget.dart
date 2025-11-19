import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transfer_section/core/utils/colors.dart';
import 'package:transfer_section/features/beneficiaries_overlay/presentation/widgets/popup_type.dart';

class PopupBottomSheet extends StatelessWidget {
  final PopupType type;

  const PopupBottomSheet({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final beneficiaryList = [
      {"name": "Within Dukhan", "icon": "assets/images/ico.svg"},
      {"name": "Within Qatar", "icon": "assets/images/Flags.svg"},
      {"name": "International", "icon": "assets/images/international.svg"},
      {"name": "Western Union", "icon": "assets/images/western_union.svg"},
    ];

    final transferList = [
      {"name": "Within Own Account", "icon": "assets/images/UserSwitch.svg"},
      {"name": "Within Dukhan", "icon": "assets/images/ico.svg"},
      {"name": "Within Qatar", "icon": "assets/images/Flags.svg"},
      {"name": "Cardless Withdrawal", "icon": "assets/images/creditcard.svg"},
      {
        "name": "International Transfer",
        "icon": "assets/images/international.svg",
      },
      {"name": "Western Union", "icon": "assets/images/western_union.svg"},
      {"name": "Schedule Transfer", "icon": "assets/images/CalendarDots.svg"},
      {"name": "Transfer history", "icon": "assets/images/CalendarDots.svg"},
    ];

    final currentList = (type == PopupType.beneficiary)
        ? beneficiaryList
        : transferList;

    final currentTitle = (type == PopupType.beneficiary)
        ? "Add New Beneficiaries"
        : null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (currentTitle != null)
            Center(
              child: Container(
                height: screenHeight * 0.006,
                width: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                margin: const EdgeInsets.only(bottom: 14),
              ),
            ),

          if (currentTitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                currentTitle!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3E8C),
                ),
              ),
            ),

          const SizedBox(height: 6),

          ...currentList.map(
            (item) => GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: DefaultColors.blue_0,
                      child: SvgPicture.asset(
                        item["icon"]!,
                        width: 26,
                        height: 26,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      item["name"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
