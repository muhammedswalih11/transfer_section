import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/colors.dart';
import '../constants/contacts.dart';
import '../controllers/account_selection_provider.dart';
import 'contact_tile.dart';

class ContactsScreen extends ConsumerWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Debug: Add some logging
    print('ContactsScreen is building, contacts length: ${contacts.length}');

    return SizedBox(
      height: screenHeight * 0.56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // All contacts in a single container
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
              ),
              child: contacts.isEmpty
                  ? Center(
                      child: Text(
                        'No contacts available',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: contacts.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ContactTile(
                              contact: contacts[index],
                              onTap: () {
                                print(
                                  'Contact tapped: ${contacts[index].name}',
                                );
                                // Set selected contact and close bottom sheet
                                ref
                                        .read(selectedContactProvider.notifier)
                                        .state =
                                    contacts[index];
                                Navigator.pop(context, contacts[index]);
                              },
                            ),
                            // Add divider after each item except the last one
                            if (index < contacts.length - 1)
                              Divider(
                                color: DefaultColors.grayTB.withAlpha(51),
                                height: 1,
                                indent: 16,
                                endIndent: 16,
                              ),
                          ],
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
