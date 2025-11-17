import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';

/// A reusable empty state card that can be configured for different modules.
class EmptyStateCard extends StatelessWidget {
  final String title;
  final String message;
  final String? actionText;
  final IconData icon;
  final String imageAsset;

  const EmptyStateCard({
    super.key,
    required this.title,
    required this.message,
    this.actionText,
    this.icon = Icons.info_outline,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 300,
      padding: const EdgeInsets.all(18),
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
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                side: const BorderSide(color: DefaultColors.blue9D, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                actionText!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
      icon: Icons.add,
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
      actionText: 'Add Beneficiary',
      icon: Icons.add,
    );
  }
}
