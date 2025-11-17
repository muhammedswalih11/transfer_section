import 'package:flutter/material.dart';
import '../widgets/add_beneficiary_popup.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<AddBeneficiaryPage> createState() => _AddBeneficiaryPageState();
}

class _AddBeneficiaryPageState extends State<AddBeneficiaryPage> {
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
              child: AddBeneficiaryBottomSheet(
                onBeneficiarySelected: (beneficiaryType) {
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
