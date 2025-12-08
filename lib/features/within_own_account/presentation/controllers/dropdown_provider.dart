import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../within_dukhan/presentation/datas/beneficiay_model.dart';
import '../../../within_dukhan/presentation/datas/search_notifier.dart';

/// Provider for From Account dropdown state (open/close)
final fromAccountDropdownProvider = StateProvider<bool>((ref) => false);

/// Provider for To Account dropdown state (open/close)
final toAccountDropdownProvider = StateProvider<bool>((ref) => false);

/// Provider for selected From Account value
final selectedFromAccountProvider = StateProvider<Map<String, String>?>(
  (ref) => null,
);

/// Provider for selected To Account value
final selectedToAccountProvider = StateProvider<Map<String, String>?>(
  (ref) => null,
);

/// Provider for account options list
final accountOptionsProvider = StateProvider<List<String>>((ref) => []);

/// Provider for terms and conditions checkbox state
final termsAcceptedProvider = StateProvider<bool>((ref) => false);

final amountControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final remarksControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final toBenificiaryProvider = StateProvider<Map<String, String>?>(
  (ref) => null,
);

final selectedPurposeProvider = StateProvider<Map<String, String>?>(
  (ref) => null,
);

final selectedSubPurposeProvider = StateProvider<String?>((ref) => null);

final amountProvider = StateProvider<String>((ref) => "");

// final beneficiariesProvider = Provider<List<BeneficiaryModel>>(
//   (ref) => [
//     BeneficiaryModel(
//       id: 'b1',
//       name: 'Aliya Khan',
//       sub: 'Dukhan Bank (QA)',
//       accNumber: 'XXXX1827',
//     ),
//     BeneficiaryModel(
//       id: 'b2',
//       name: 'Sangita Raman',
//       sub: 'Dukhan Bank (QA)',
//       accNumber: 'XXXX5432',
//     ),
//     BeneficiaryModel(
//       id: 'b3',
//       name: 'Yasmin Noor',
//       sub: 'Western Union (Cash)',
//       accNumber: 'XXXX9876',
//     ),
//   ],
// );

// final beneficiariesSearchProvider =
//     StateNotifierProvider<
//       SearchNotifier<BeneficiaryModel>,
//       List<BeneficiaryModel>
//     >((ref) {
//       final list = ref.read(beneficiariesProvider);
//       return SearchNotifier<BeneficiaryModel>(
//         list,
//         (b) => '${b.name} ${b.sub}',
//       );
//     });

final isOwnAccountTransferEnabledProvider = Provider<bool>((ref) {
  final fromAccount = ref.watch(selectedFromAccountProvider);
  final toAccount = ref.watch(selectedToAccountProvider);
  final amount = ref.watch(amountProvider);
  final termsAccepted = ref.watch(termsAcceptedProvider);

  return fromAccount != null &&
      toAccount != null &&
      amount.isNotEmpty &&
      termsAccepted == true;
});

final selectedCurrencyCodeProvider = StateProvider<String>((ref) => "QAR");

final selectedCurrencyIconProvider = StateProvider<String>(
  (ref) => "assets/images/qatar.svg",
);

final tempCurrencySelectionProvider = StateProvider<String?>((ref) => null);
