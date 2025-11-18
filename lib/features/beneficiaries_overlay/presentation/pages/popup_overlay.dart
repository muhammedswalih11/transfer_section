import 'package:flutter/material.dart';
import 'package:transfer_section/features/beneficiaries_overlay/presentation/widgets/popup_type.dart';
import 'package:transfer_section/features/beneficiaries_overlay/presentation/widgets/popup_widget.dart';

class PopupLauncherPage extends StatelessWidget {
  final PopupType type;

  const PopupLauncherPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),

      body: GestureDetector(
        onTap: () => Navigator.pop(context),

        child: Stack(
          children: [
            const SizedBox.expand(),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                initialChildSize: 0.45,
                minChildSize: 0.45,
                maxChildSize: 0.95,
                builder: (context, scrollController) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,

                    child: PopupBottomSheet(type: type),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
