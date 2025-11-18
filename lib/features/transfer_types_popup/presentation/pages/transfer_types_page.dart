import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../widgets/transfers_type_popup.dart';

class TransferTypesPage extends StatefulWidget {
  const TransferTypesPage({super.key});

  @override
  State<TransferTypesPage> createState() => _TransferTypesPageState();
}

class _TransferTypesPageState extends State<TransferTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.black.withOpacity(0.5),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          children: [
            const SizedBox.expand(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TransferTypesBottomSheet(
                onTransferTypeSelected: (transferType) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
