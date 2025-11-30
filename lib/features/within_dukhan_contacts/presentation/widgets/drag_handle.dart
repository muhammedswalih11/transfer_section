import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 5,
        margin: const EdgeInsets.only(top: 8, bottom: 12),
        decoration: BoxDecoration(
          color: DefaultColors.grayD4,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
