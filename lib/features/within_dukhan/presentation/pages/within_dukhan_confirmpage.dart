import 'package:flutter/material.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/within_dukhan_succes.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/within_dukhan_transfercard.dart';

import '../../../../core/utils/colors.dart';

class WithinDukhanConfirmpage extends StatefulWidget {
  final Map<String, String> transferDataOfWithinDukhan;
  const WithinDukhanConfirmpage({
    super.key,
    required this.transferDataOfWithinDukhan,
  });

  @override
  State<WithinDukhanConfirmpage> createState() =>
      _WithinDukhanConfirmpageState();
}

class _WithinDukhanConfirmpageState extends State<WithinDukhanConfirmpage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screenHeight * 0.035),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 7, 110, 141),
              DefaultColors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: DefaultColors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Confirm Transfer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: screenWidth,

                  padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Make sure the below transfer details are correct',
                        style: TextStyle(
                          fontSize: screenWidth * 0.036,
                          color: DefaultColors.grayMedBase,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      WithinDukhanTransfercard(
                        fromAccount:
                            widget.transferDataOfWithinDukhan["fromAccount"]!,
                        toBenificiaryContact: widget
                            .transferDataOfWithinDukhan["toBeneficiaryContact"]!,
                        totalAmount:
                            widget.transferDataOfWithinDukhan["totalAmount"]!,
                        purposeofTransfer:
                            widget.transferDataOfWithinDukhan["purpose"]!,
                        remarks: widget.transferDataOfWithinDukhan["remarks"]!,
                        fee: double.parse(
                          widget.transferDataOfWithinDukhan["fee"]!,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(
                                      context,
                                    ).viewInsets.bottom,
                                  ),
                                  child: WithinDukhanSucces(
                                    data: widget.transferDataOfWithinDukhan,
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DefaultColors.dashboarddarkBlue,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.013,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Transfer',
                            style: TextStyle(
                              color: DefaultColors.white,
                              fontSize: screenWidth * 0.043,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
