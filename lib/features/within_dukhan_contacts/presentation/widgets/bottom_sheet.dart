import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/core/utils/colors.dart';
import 'package:transfer_section/features/within_dukhan_contacts/presentation/widgets/beneficiaries.dart';
import 'package:transfer_section/features/within_dukhan/presentation/datas/beneficiay_model.dart';

import '../controllers/account_selection_provider.dart';
import 'account_selection_content.dart';
import 'contacts_screen.dart';
import 'deactivate_visibilty_state_screen.dart';
import 'enable_visibility_state_screen.dart';
import 'initial_content.dart';
import 'search_bar_section.dart';
import 'selection_section.dart';

class TransferBottomSheetWidget extends ConsumerWidget {
  const TransferBottomSheetWidget({super.key});

  // Sample beneficiaries data
  static final List<dynamic> _sampleBeneficiaries = [
    BeneficiaryModel(
      id: '1',
      name: 'Aliya Khan',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX1827',
    ),
    BeneficiaryModel(
      id: '2',
      name: 'Sara Rahman',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX2345',
    ),
    BeneficiaryModel(
      id: '3',
      name: 'Yusuf Naser',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX6789',
    ),
    BeneficiaryModel(
      id: '4',
      name: 'Ahmad Ali',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX3456',
    ),
    BeneficiaryModel(
      id: '5',
      name: 'Fatima Hassan',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX7890',
    ),
    BeneficiaryModel(
      id: '6',
      name: 'Omar Ibrahim',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX4567',
    ),
    BeneficiaryModel(
      id: '7',
      name: 'Layla Mohamed',
      sub: 'Dukhan Bank',
      accNumber: 'XXXX8901',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final step = ref.watch(contentStepProvider);
    final filter = ref.watch(selectionProvider);

    // Debug logging
    print('BottomSheet - filter: $filter, step: $step');

    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWidth * 0.05),
          topRight: Radius.circular(screenWidth * 0.05),
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.9, // Maximum height
          minHeight: screenHeight * 0.3,
          // Minimum height
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.024, // Reduced top padding
            left: screenWidth * 0.04, //16
            right: screenWidth * 0.04,
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                screenHeight * 0.024, // Dynamic bottom padding for keyboard
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Let column size itself
            children: [
              Center(
                child: Container(
                  height: screenHeight * 0.006,
                  width: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    color: DefaultColors.graylight,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.only(bottom: 14),
                ),
              ),
              Text(
                "Select Beneficiary/Contact",
                style: TextStyle(
                  fontSize: screenWidth * 0.058, //24
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.020), // Reduced spacing
              //Search bar
              SearchBarSection(selectedFilter: filter),
              SizedBox(height: screenHeight * 0.020), // Reduced spacing
              //Benefeciries/Contacts filter section
              SelectionBarSection(
                beneficiariesCount: _sampleBeneficiaries.length,
                contactsCount: 0, // Set contacts count to 0
              ),
              SizedBox(height: screenHeight * 0.020), // Reduced spacing
              //Display content based on selected filter
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (filter == 'Beneficiaries')
                              Beneficiaries(
                                display: _sampleBeneficiaries,
                                iconSize: 18,
                              ),
                            if (filter == 'Contacts') ...[
                              //Before pressing continue InitialContent is displayed
                              //After pressing continue hides InitialContent
                              if (step == 0) const InitialContent(),
                              if (step == 1) const AccountSelectionContent(),
                              if (step == 2)
                                const DeactivateVisibiltyStateScreen(),
                              if (step == 3) const ContactsScreen(),
                              if (step == 4)
                                const EnableVisibilityStateScreen(),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
