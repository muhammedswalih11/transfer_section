
// class TransferDetailsCard extends StatelessWidget {
//   final String fromAccount;
//   final String toAccount;
//   final String amount;
//   final String remarks;
//   const TransferDetailsCard({
//     super.key,
//     required this.fromAccount,
//     required this.toAccount,
//     required this.amount,
//     required this.remarks,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     return Container(
//       width: screenWidth,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF2F4F7), // light grey background
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // From Account
//           label("From account"),
//           value(fromAccount),
//           const SizedBox(height: 20),

//           // To Account
//           label("To account"),
//           value(toAccount),
//           const SizedBox(height: 20),

//           // Amount
//           label("Amount"),
//           value(amount),
//           const SizedBox(height: 20),

//           // Remarks
//           label("Remarks"),
//           value(remarks),
//         ],
//       ),
//     );
//   }

//   Widget label(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontSize: 14,
//         color: Colors.black54,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }

//   Widget value(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontSize: 17,
//         fontWeight: FontWeight.bold,
//         color: Colors.black87,
//       ),
//     );
//   }
// }



// class TransferSuccessPopup extends StatelessWidget {
//   final Map<String, String> data;

//   const TransferSuccessPopup({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Success icon
//           const SizedBox(height: 16),

//           const Text(
//             "Transfer Successful",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),

//           const SizedBox(height: 24),

//           // DETAILS CONTAINER (same values + extra)
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF2F4F7),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _label("From account"),
//                 _value(data["fromAccount"]!),
//                 const SizedBox(height: 20),

//                 _label("To account"),
//                 _value(data["toAccount"]!),
//                 const SizedBox(height: 20),

//                 _label("Amount"),
//                 _value(data["amount"]!),
//                 const SizedBox(height: 20),

//                 _label("Remarks"),
//                 _value(data["remarks"]!),
//                 const SizedBox(height: 20),

//                 // EXTRA FIELD
//                 _label("Reference number"),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _value(data["reference"]!),
//                     GestureDetector(
//                       onTap: () {
//                         Clipboard.setData(
//                           ClipboardData(text: data["reference"]!),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("Copied to clipboard"),
//                             duration: Duration(seconds: 1),
//                           ),
//                         );
//                       },
//                       child: const Icon(Icons.copy, size: 20),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Done button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Text(
//                 "Done",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _label(String text) => Text(
//     text,
//     style: const TextStyle(
//       fontSize: 14,
//       color: Colors.black54,
//       fontWeight: FontWeight.w500,
//     ),
//   );

//   Widget _value(String text) => Text(
//     text,
//     style: const TextStyle(
//       fontSize: 17,
//       fontWeight: FontWeight.bold,
//       color: Colors.black87,
//     ),
//   );
// }


// class ConfirmPage extends StatefulWidget {
//   ConfirmPage({super.key});

//   @override
//   State<ConfirmPage> createState() => _ConfirmPageState();
// }

// class _ConfirmPageState extends State<ConfirmPage> {
//   final Map<String, String> transferData = {
//     "fromAccount": "Savings Account xxxx2088",
//     "toAccount": "Current Account xxxx1998",
//     "amount": "400.00",
//     "reference": "REF789654321",
//     "remarks": "Self transfer",
//   };

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;

//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(top: 35),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               const Color.fromARGB(255, 7, 110, 141),
//               DefaultColors.white,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       color: DefaultColors.white,
//                     ),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                   Text(
//                     'Confirm Transfer',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: DefaultColors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 24),
//               Expanded(
//                 child: Container(
//                   width: screenWidth,

//                   padding: EdgeInsets.only(top: 32, left: 16, right: 16),
//                   decoration: BoxDecoration(
//                     color: DefaultColors.white,
//                     borderRadius: BorderRadius.circular(28),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset('assets/images/Add (1).svg', width: 80),
//                       SizedBox(height: 16),
//                       Text(
//                         'Please confirm the details',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: DefaultColors.black,
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       TransferDetailsCard(
//                         fromAccount: transferData["fromAccount"]!,
//                         toAccount: transferData["toAccount"]!,
//                         amount: transferData["amount"]!,
//                         remarks: transferData["remarks"]!,
//                       ),
//                       Spacer(),
//                       BottomButton(
//                         onPressed: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             backgroundColor: Colors.transparent,
//                             builder: (_) =>
//                                 TransferSuccessPopup(data: transferData),
//                           );
//                         },
//                         buttonColor: DefaultColors.gray2D,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


