import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../within_own_account/presentation/providers/dropdown_provider.dart';
import '../../../within_own_account/presentation/widgets/custom_input_field.dart';

class PurposeOfTransfer extends ConsumerWidget {
  final String labeltext;

  final VoidCallback onTap;

  const PurposeOfTransfer({
    super.key,
    required this.labeltext,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPurpose = ref.watch(selectedPurposeProvider);
    final controller = TextEditingController(
      text: selectedPurpose?['title'] ?? "",
    );
    return CustomInputField(
      label: labeltext,
      controller: controller,

      showDropdown: true,
      onTap: onTap,
    );
  }
}

class SubPurpose extends ConsumerWidget {
  String labeltext;
  final VoidCallback onTap;

  SubPurpose({super.key, required this.labeltext, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef Ref) {
    final seletcedSubPurpose = Ref.watch(selectedSubPurposeProvider);
    final controller = TextEditingController(text: seletcedSubPurpose ?? "");
    return CustomInputField(
      label: labeltext,
      controller: controller,

      showDropdown: true,
      onTap: onTap,
    );
  }
}
