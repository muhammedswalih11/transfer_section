import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../widgets/add_beneficiary_sheet.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<AddBeneficiaryPage> createState() => _AddBeneficiaryPageState();
}

class _AddBeneficiaryPageState extends State<AddBeneficiaryPage> {
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
              child: AddBeneficiaryBottomSheet(
                onBeneficiarySelected: (beneficiaryType) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
