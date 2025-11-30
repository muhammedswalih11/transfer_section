import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/colors.dart';
import '../controllers/account_selection_provider.dart';

class AccountSelector extends ConsumerWidget {
  const AccountSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final selected = ref.watch(accountSelectionProvider);

    Widget buildAccountTile({
      required String id,
      required String title,
      required String accountNumber,
      required String balance,
    }) {
      final bool isSelected = selected == id;

      return GestureDetector(
        onTap: () {
          ref.read(accountSelectionProvider.notifier).state = id;
        },
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            border: Border.all(
              color: isSelected
                  ? DefaultColors.dashboardBlue
                  : DefaultColors.grayTB.withAlpha(51),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: DefaultColors.blackT,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      accountNumber,
                      style: TextStyle(
                        fontSize: screenWidth * 0.036,
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.grayTB.withAlpha(153),
                      ),
                    ),
                  ],
                ),
                Text(
                  balance,
                  style: TextStyle(
                    color: DefaultColors.blackT,
                    fontSize: screenWidth * 0.036,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        buildAccountTile(
          id: "savings",
          title: "Savings Account",
          accountNumber: "xxxx2088",
          balance: "889,200.00 QAR",
        ),
        const SizedBox(height: 12),
        buildAccountTile(
          id: "current",
          title: "Current Account",
          accountNumber: "xxxx6238",
          balance: "7,540.00 QAR",
        ),
      ],
    );
  }
}
