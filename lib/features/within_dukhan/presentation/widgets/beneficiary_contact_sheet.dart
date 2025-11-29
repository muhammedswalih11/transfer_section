import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/beneficiary_header.dart';
import 'package:transfer_section/features/within_dukhan/presentation/widgets/beneficiary_searchfield.dart';

import '../../../../core/utils/colors.dart';
import '../../../within_own_account/presentation/providers/dropdown_provider.dart';
import 'benefiaciary_list.dart';
import 'beneficiary_tab_bar.dart';

class BeneficiaryBottomSheetContent extends ConsumerStatefulWidget {
  final MediaQueryData mq;
  const BeneficiaryBottomSheetContent({required this.mq});

  @override
  ConsumerState<BeneficiaryBottomSheetContent> createState() =>
      _BeneficiaryBottomSheetContentState();
}

class _BeneficiaryBottomSheetContentState
    extends ConsumerState<BeneficiaryBottomSheetContent> {
  String active = 'beneficiaries';
  final searchCtrl = TextEditingController();

  static const double _iconSize = 18;

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.mq.size.width;
    final filtered = ref.watch(beneficiariesSearchProvider);

    final List display = List.from(filtered);
    final aliyaList = display
        .where((b) => b.name.trim().toLowerCase() == 'aliya khan')
        .toList();
    if (aliyaList.length == 1) {
      final idx = display.indexWhere(
        (b) => b.name.trim().toLowerCase() == 'aliya khan',
      );
      if (idx != -1) {
        final original = display[idx];
        final copy = original;
        display.insert(idx + 1, copy);
      }
    }

    final handleWidth = w * 0.12;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BeneficiaryHeader(handleWidth: handleWidth),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: BeneficiarySearchField(
                    iconSize: _iconSize,
                    onSearch: (v) => ref
                        .read(beneficiariesSearchProvider.notifier)
                        .search(v),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: w * 0.12,
                  width: w * 0.12,
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: DefaultColors.blue9D),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      color: DefaultColors.blue9D,
                      size: _iconSize,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            BeneficiaryTabBar(
              filteredCount: filtered.length,
              active: active,
              onTabSelected: (tab) => setState(() => active = tab),
              height: w * 0.11,
              cornerRadius: 30,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: DefaultColors.white,
                  border: Border.all(color: DefaultColors.grayE6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: active == 'beneficiaries'
                      ? BeneficiaryList(display: display, iconSize: _iconSize)
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              'Contacts placeholder — contacts are handled separately',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: DefaultColors.gray82),
                            ),
                          ),
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
