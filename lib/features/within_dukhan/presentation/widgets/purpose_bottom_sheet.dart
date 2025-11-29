import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/core/utils/colors.dart';

import '../../../within_own_account/presentation/providers/dropdown_provider.dart';

// class PurposeBottomSheet extends StatefulWidget {
//   final Function(Map<String, String>) onSelected;

//   const PurposeBottomSheet({super.key, required this.onSelected});

//   @override
//   State<PurposeBottomSheet> createState() => _PurposeBottomSheetState();
// }

// class _PurposeBottomSheetState extends State<PurposeBottomSheet> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();

//   final List<Map<String, String>> purposes = [
//     {"id": "1", "title": "E-Payment"},
//     {"id": "2", "title": "Person to Person Payment"},
//     {"id": "3", "title": "Government Payment"},
//     {"id": "4", "title": "Salary Payment"},
//     {"id": "5", "title": "Other Payment"},
//   ];

//   List<Map<String, String>> filteredPurposes = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredPurposes = purposes;
//     _searchController.addListener(_filterList);
//   }

//   void _filterList() {
//     final query = _searchController.text.toLowerCase();

//     setState(() {
//       filteredPurposes = purposes
//           .where((item) => item["title"]!.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: MediaQuery.of(context).viewInsets,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // top small bar
//             Container(
//               width: 45,
//               height: 5,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Title
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Select Purpose",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 15),

//             // 🔥 SEARCH BAR (centered icon + centered hint + working input)
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(50),
//                 border: Border.all(color: Colors.grey.shade300, width: 1.2),
//               ),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Centered icon + hint (visible only when TextField is empty)
//                   if (!_focusNode.hasFocus && _searchController.text.isEmpty)
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Icon(Icons.search, color: Colors.grey, size: 20),
//                         SizedBox(width: 8),
//                         Text(
//                           "Type to Search",
//                           style: TextStyle(color: Colors.grey, fontSize: 15),
//                         ),
//                       ],
//                     ),

//                   // Actual textfield on top (full width)
//                   TextField(
//                     controller: _searchController,
//                     focusNode: _focusNode,
//                     cursorColor: Colors.black,
//                     textAlign: TextAlign.center,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.zero,
//                     ),

//                     onChanged: (value) {
//                       setState(() {}); // rebuild to hide/show centered hint
//                     },
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // List (filtered)
//             Flexible(
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 itemCount: filteredPurposes.length,
//                 separatorBuilder: (_, __) => const Divider(height: 1),
//                 itemBuilder: (context, index) {
//                   final item = filteredPurposes[index];

//                   return ListTile(
//                     title: Text(
//                       item['title']!,
//                       style: const TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     trailing: const Icon(
//                       Icons.arrow_forward_ios,
//                       size: 16,
//                       color: Colors.black,
//                     ),
//                     onTap: () {
//                       widget.onSelected(item);
//                       Navigator.pop(context);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class UniversalPurposeSheet extends StatefulWidget {
  final bool isSubPurpose;

  final Function(Map<String, String>)? onPurposeSelected;
  final Function(String)? onSubPurposeSelected;

  const UniversalPurposeSheet({
    super.key,
    required this.isSubPurpose,
    this.onPurposeSelected,
    this.onSubPurposeSelected,
  });

  @override
  State<UniversalPurposeSheet> createState() => _UniversalPurposeSheetState();
}

class _UniversalPurposeSheetState extends State<UniversalPurposeSheet> {
  // 🔥 SEARCH FIELD
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // 🔥 PURPOSE LIST (Your original)
  final List<Map<String, String>> purposeList = [
    {"id": "1", "title": "E-Payment"},
    {"id": "2", "title": "Person to Person Payment"},
    {"id": "3", "title": "Government Payment"},
    {"id": "4", "title": "Salary Payment"},
    {"id": "5", "title": "Other Payment"},
  ];

  // 🔥 SUB PURPOSE LIST (Your screenshot)
  final List<String> subPurposeList = [
    "Sub- Purpose 1",
    "Sub- Purpose 2",
    "Sub- Purpose 3",
    "Sub- Purpose 4",
    "Sub- Purpose 5",
  ];

  List<dynamic> filteredItems = [];

  @override
  void initState() {
    super.initState();

    // Select data based on which sheet is requested
    filteredItems = widget.isSubPurpose ? subPurposeList : purposeList;

    _searchController.addListener(_filterList);
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (widget.isSubPurpose) {
        filteredItems = subPurposeList
            .where((sub) => sub.toLowerCase().contains(query))
            .toList();
      } else {
        filteredItems = purposeList
            .where((p) => p["title"]!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // top bar
            Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            // title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.isSubPurpose ? "Select Subpurpose" : "Select Purpose",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // ⭐ centered search bar
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (!_focusNode.hasFocus && _searchController.text.isEmpty)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.search, color: Colors.grey, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "Type to Search",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                  TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ⭐ LIST VIEW
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: filteredItems.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];

                  return ListTile(
                    title: Text(
                      widget.isSubPurpose ? item : item["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: widget.isSubPurpose
                        ? null
                        : const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      if (widget.onSubPurposeSelected != null) {
                        widget.onSubPurposeSelected!(item);
                      } else if (widget.onPurposeSelected != null) {
                        widget.onPurposeSelected!(item);
                      }
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
