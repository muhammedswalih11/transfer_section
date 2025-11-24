import 'package:flutter_riverpod/flutter_riverpod.dart';

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
