import 'package:flutter/material.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/header_section.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/circle_action_button.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/empty_transactions_card.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/favourite_container.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/widgets/transfer_money.dart';

import '../../../../core/utils/colors.dart';

class TransferEmptyPage extends StatefulWidget {
  const TransferEmptyPage({super.key});

  @override
  State<TransferEmptyPage> createState() => _TransferEmptyPageState();
}

class _TransferEmptyPageState extends State<TransferEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [DefaultColors.blue_150_db, DefaultColors.white],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: DefaultColors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Transfers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: DefaultColors.white,
                      ),
                    ),
                    Spacer(),
                    CircleActionButtton(),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      SectionHeader(title: "Favourites", showButton: false),
                      SizedBox(height: 16),
                      DottedContainerWidget(),
                      SizedBox(height: 28),
                      TransferMoneyCard(),
                      SizedBox(height: 25),
                      SectionHeader(
                        title: "Recent Transactions",
                        showButton: false,
                      ),
                      SizedBox(height: 16),
                      RecentTransactionsCard(),
                      SizedBox(height: 25),
                      SectionHeader(title: "Beneficiaries", showButton: false),
                      SizedBox(height: 16),
                      BeneficariesCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
