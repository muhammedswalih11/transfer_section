import 'package:flutter/material.dart';

import 'currency_item.dart';

class CurrencyBottomSheet extends StatefulWidget {
  const CurrencyBottomSheet({super.key});

  @override
  State<CurrencyBottomSheet> createState() => _CurrencyBottomSheetState();
}

class _CurrencyBottomSheetState extends State<CurrencyBottomSheet> {
  String selectedCurrency = "QAR";

  final List<Map<String, String>> currencies = [
    {"flag": "assets/images/qatar.svg", "code": "QAR", "name": "Qatar Riyal"},
    {"flag": "assets/images/usd.png", "code": "USD", "name": "US Dollar"},
    {"flag": "assets/images/eur.png", "code": "EUR", "name": "Euro"},
    {"flag": "assets/images/gbp.png", "code": "GBP", "name": "Pound Sterling"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            "Choose Currency",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // White container with currency list
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: currencies.map((c) {
                return CurrencyItem(
                  flagPath: c["flag"]!,
                  code: c["code"]!,
                  name: c["name"]!,
                  isSelected: selectedCurrency == c["code"],
                  onTap: () {
                    setState(() {
                      selectedCurrency = c["code"]!;
                    });
                  },
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 20),

          // Close button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF002B7F),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Close",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
