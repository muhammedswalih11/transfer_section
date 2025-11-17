import 'package:flutter/material.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/empty_transactions_card.dart';

class TransferEmptyPage extends StatefulWidget {
  const TransferEmptyPage({super.key});

  @override
  State<TransferEmptyPage> createState() => _TransferEmptyPageState();
}

class _TransferEmptyPageState extends State<TransferEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RecentTransactionsCard(),
              SizedBox(height: 40),
              BeneficariesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
