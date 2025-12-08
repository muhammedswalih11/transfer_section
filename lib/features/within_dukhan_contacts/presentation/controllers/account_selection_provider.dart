import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../within_own_account/presentation/controllers/dropdown_provider.dart';
import '../data/contact_model.dart';

final accountSelectionProvider = StateProvider<String?>((ref) => 'savings');

final selectionProvider = StateProvider<String?>((ref) => 'Contacts');

final contentStepProvider = StateProvider<int>((ref) => 0);

final visibilityProvider = StateProvider<bool?>((ref) => null);

final selectedContactProvider = StateProvider<ContactModel?>((ref) => null);

final isTransferEnabledProvider = Provider<bool>((ref) {
  final from = ref.watch(selectedFromAccountProvider);
  final to = ref.watch(toBenificiaryProvider);
  final amount = ref.watch(amountProvider);
  final purpose = ref.watch(selectedPurposeProvider);
  final subPurpose = ref.watch(selectedSubPurposeProvider);
  final termsAccepted = ref.watch(termsAcceptedProvider);

  bool hasAmount = amount.isNotEmpty && double.tryParse(amount) != null;

  // If purpose requires sub-purpose, check that too
  bool subPurposeRequired = purpose != null && purpose['hasSubpurpose'] == true;

  return from != null &&
      to != null &&
      hasAmount &&
      purpose != null &&
      (!subPurposeRequired || subPurpose != null) &&
      termsAccepted == true;
});
