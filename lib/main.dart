import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/beneficiaries_overlay/presentation/pages/popup_overlay.dart';
import 'package:transfer_section/features/beneficiaries_overlay/presentation/widgets/popup_type.dart';
import 'package:transfer_section/features/own_flow_page/presentation/pages/within_own_account_page.dart';
import 'package:transfer_section/features/transfers_emptystate/presentation/pages/transfer_empty_state.dart';

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
      home: WithinOwnAccountPage(),
    );
  }
}
