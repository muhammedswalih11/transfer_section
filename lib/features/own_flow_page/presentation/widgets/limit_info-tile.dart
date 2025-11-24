import 'package:flutter/material.dart';
import 'package:transfer_section/core/utils/colors.dart';

class LimitInfoTile extends StatelessWidget {
  final VoidCallback onTap;

  const LimitInfoTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
        decoration: BoxDecoration(
          color: DefaultColors.blue04,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Text(
              "Limit: ---   |   Transfers Left: --",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
