import 'package:flutter/material.dart';

class CurrencyItem extends StatelessWidget {
  final String flagPath;
  final String code;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CurrencyItem({
    super.key,
    required this.flagPath,
    required this.code,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Row(
          children: [
            Image.asset(flagPath, width: 35, height: 35),
            const SizedBox(width: 12),

            // Currency name + type
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),

            const Spacer(),

            // Selection circle
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
