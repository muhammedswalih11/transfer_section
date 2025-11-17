import 'package:flutter/material.dart';
import '../widgets/transfer_types_bottom_sheet.dart';

class TransferTypesPage extends StatefulWidget {
  const TransferTypesPage({super.key});

  @override
  State<TransferTypesPage> createState() => _TransferTypesPageState();
}

class _TransferTypesPageState extends State<TransferTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          children: [
            const SizedBox.expand(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TransferTypesBottomSheet(
                onTransferTypeSelected: (transferType) {
                  // Handle selection if needed
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
