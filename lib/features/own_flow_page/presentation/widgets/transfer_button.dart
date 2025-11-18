import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class TransferButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const TransferButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 188, 205, 214),
          foregroundColor: DefaultColors.black51,
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          'Transfer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: DefaultColors.white,
          ),
        ),
      ),
    );
  }
}
