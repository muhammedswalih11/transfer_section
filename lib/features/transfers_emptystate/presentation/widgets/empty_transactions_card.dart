import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';

class EmptyStateCard extends StatelessWidget {
  final String title;
  final String message;
  final String? actionText;
  final IconData icon;
  final String imageAsset;
  final IconData? iconButton;

  const EmptyStateCard({
    super.key,
    required this.title,
    required this.message,
    this.actionText,
    this.icon = Icons.info_outline,
    required this.imageAsset,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.3,
      padding: const EdgeInsets.only(top: 24, bottom: 20),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: DefaultColors.grayE5, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(imageAsset),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: DefaultColors.gray2D,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(fontSize: 14, color: DefaultColors.gray7D),
            textAlign: TextAlign.center,
          ),
          if (actionText != null) ...[
            const SizedBox(height: 28),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: DefaultColors.blue03,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: iconButton != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(iconButton, color: DefaultColors.blue9D),
                        const SizedBox(width: 8),
                        Text(
                          actionText!,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: DefaultColors.blue9D,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      actionText!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: DefaultColors.blue9D,
                      ),
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Backwards-compatible specific empty transactions widget using [EmptyStateCard].
class RecentTransactionsCard extends StatelessWidget {
  final VoidCallback? onMakeTransaction;
  const RecentTransactionsCard({super.key, this.onMakeTransaction});

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      imageAsset: 'assets/images/Add.svg',
      title: 'No Transactions Yet',
      message: 'All your first transactions will appear here.',
      actionText: 'Make Transaction',
    );
  }
}

class BeneficariesCard extends StatelessWidget {
  final VoidCallback? onMakeTransaction;
  const BeneficariesCard({super.key, this.onMakeTransaction});

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      imageAsset: 'assets/images/Add (1).svg',

      title: 'No Beneficiaries Added',
      message: 'All your Beneficiaries will appear here.',
      actionText: 'Add Beneficiaries',
      iconButton: Icons.add,
    );
  }
}
