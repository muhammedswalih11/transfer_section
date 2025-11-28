import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/colors.dart';
import '../../../within_own_account/presentation/providers/dropdown_provider.dart';

class TermsAndConditionsCheckbox extends ConsumerWidget {
  const TermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
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
              color: isAccepted ? DefaultColors.blue9D : Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: DefaultColors.blue9D, width: 2),
            ),
            child: isAccepted
                ? Icon(
                    Icons.check,
                    color: DefaultColors.white,
                    size: screenWidth * 0.04,
                  )
                : null,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: DefaultColors.black51),
              children: [
                TextSpan(
                  text: 'I have Read and Accept the ',
                  style: TextStyle(
                    color: DefaultColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    color: DefaultColors.flatblue,
                    fontWeight: FontWeight.w600,
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
