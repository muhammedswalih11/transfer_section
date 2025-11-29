import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class BeneficiarySearchField extends StatelessWidget {
  final double iconSize;
  final ValueChanged<String> onSearch;

  const BeneficiarySearchField({
    super.key,
    required this.iconSize,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      width: w * 0.78, // Reduced width ✔
      height: h * 0.055,
      decoration: BoxDecoration(
        color: DefaultColors.whiteFA,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: DefaultColors.grayE6),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            onChanged: onSearch,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: w * 0.038, color: DefaultColors.black24),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Type to Search",
              hintStyle: TextStyle(
                fontSize: w * 0.038,
                color: DefaultColors.gray82,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
          Positioned(
            left: w * 0.17,
            child: Icon(
              Icons.search,
              size: iconSize,
              color: DefaultColors.blue9D,
            ),
          ),
        ],
      ),
    );
  }
}
