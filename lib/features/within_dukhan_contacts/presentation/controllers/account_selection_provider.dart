import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/contact_model.dart';

final accountSelectionProvider = StateProvider<String?>((ref) => 'savings');

final selectionProvider = StateProvider<String?>((ref) => 'Contacts');

final contentStepProvider = StateProvider<int>((ref) => 0);

final visibilityProvider = StateProvider<bool?>((ref) => null);

final selectedContactProvider = StateProvider<ContactModel?>((ref) => null);
