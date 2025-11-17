import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/add_beneficiary_popup/presentation/pages/add_beneficiary_page.dart';
import 'package:transfer_section/features/own_flow_page/presentation/pages/within_own_account_page.dart';
import 'package:transfer_section/features/transfer_types_popup/presentation/pages/transfer_types_page.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/pages/transfer_empty.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TransferTypesPage(),
    );
  }
}
