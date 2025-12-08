import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/within_own_account/presentation/controllers/dropdown_provider.dart';

import '../../../../core/utils/colors.dart';
import '../../../within_dukhan_contacts/presentation/controllers/account_selection_provider.dart';
import '../../../within_dukhan_contacts/presentation/data/beneficiary_model.dart';
import '../../../within_dukhan_contacts/presentation/widgets/beneficiaries.dart';
import '../../../within_dukhan_contacts/presentation/widgets/search_bar_section.dart';
import '../../../within_dukhan_contacts/presentation/widgets/selection_section.dart';

class BeneficiaryDukhan extends ConsumerStatefulWidget {
  const BeneficiaryDukhan({super.key});

  @override
  ConsumerState<BeneficiaryDukhan> createState() =>
      _TransferBottomSheetWidgetState();
}

class _TransferBottomSheetWidgetState extends ConsumerState<BeneficiaryDukhan> {
  final List<Beneficiary> _sampleBeneficiaries = [
    Beneficiary(
      name: "Yasmin Noor",
      id: "XXXX8817",
      bank: "Dukhan Bank (QA)",
      isDisabled: true,
      statusText: "1 hr 55 min",
    ),
    Beneficiary(
      name: "Sara Rahman",
      id: "XXXXXX2029",
      bank: "Attijari Bank",
      localImage: "assets/images/sara.png",
    ),
    Beneficiary(name: "Aliya Khan", id: "XXXX1827", bank: "Dukhan Bank (QA)"),
    const Beneficiary(
      name: "Sangita Raman",
      id: "XXXX8817",
      bank: "Attijari Bank",
    ),
    const Beneficiary(
      name: "Yasmin Noor",
      id: "XXXX8817",
      bank: "Dukhan Bank (QA)",
    ),
    const Beneficiary(
      name: "Rashidullah Khan",
      id: "XXXX8817",
      bank: "Dukhan Bank (QA)",
      localImage: "assets/images/sara.png",
    ),
  ];

  void _toggleFavourite(int index) {
    setState(() {
      final old = _sampleBeneficiaries[index];
      _sampleBeneficiaries[index] = Beneficiary(
        name: old.name,
        id: old.id,
        bank: old.bank,
        avatarUrl: old.avatarUrl,
        localImage: old.localImage,
        isFavourite: !(old.isFavourite ?? false),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: screenHeight * 0.040), // Increased spacing
              //Display content based on selected filter
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (filter == 'Beneficiaries')
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: DefaultColors.grayE6,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _sampleBeneficiaries.length > 5
                                      ? 5
                                      : _sampleBeneficiaries.length,
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        height: 1,
                                        color: DefaultColors.grayE6,
                                      ),
                                  itemBuilder: (context, index) {
                                    return BeneficiaryTile(
                                      beneficiary: _sampleBeneficiaries[index],
                                      showActionButton: false,
                                      onTap: () {
                                        Navigator.pop(context);
                                        ref
                                            .read(
                                              toBenificiaryProvider.notifier,
                                            )
                                            .state = {
                                          'title':
                                              _sampleBeneficiaries[index].name,
                                          'accnumber':
                                              _sampleBeneficiaries[index].id,
                                        };
                                      },
                                    );
                                  },
                                ),
                              ),
                            if (filter == 'Contacts') ...[
                              //Before pressing continue InitialContent is displayed
                              //After pressing continue hides InitialContent
                              // if (step == 0) const InitialContent(),
                              // if (step == 1) const AccountSelectionContent(),
                              // if (step == 2)
                              //   const DeactivateVisibiltyStateScreen(),
                              // if (step == 3) const ContactsScreen(),
                              // if (step == 4)
                              //   const EnableVisibilityStateScreen(),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Text(
                                    "No contacts available currently",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: DefaultColors.grayBase,
                                    ),
                                  ),
                                ),
                              ),
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
