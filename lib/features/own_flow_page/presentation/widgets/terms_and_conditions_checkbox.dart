import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/colors.dart';
import '../providers/dropdown_provider.dart';

class TermsAndConditionsCheckbox extends ConsumerWidget {
  final double screenWidth;
  final double screenHeight;

  const TermsAndConditionsCheckbox({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAccepted = ref.watch(termsAcceptedProvider);

    return Row(
      children: [
        InkWell(
          onTap: () {
            ref.read(termsAcceptedProvider.notifier).state = !isAccepted;
          },
          child: Container(
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isAccepted ? DefaultColors.white : Colors.transparent,
              border: Border.all(color: DefaultColors.blue9D, width: 2),
            ),
            child: isAccepted
                ? Icon(Icons.circle, color: DefaultColors.blue88, size: 16)
                : null,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                color: DefaultColors.black51,
              ),
              children: [
                const TextSpan(
                  text: 'I accept the ',
                  style: TextStyle(color: DefaultColors.black),
                ),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(
                    color: DefaultColors.blue9D,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
