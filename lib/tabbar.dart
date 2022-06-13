import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberNotifier extends StateNotifier<int> {
  NumberNotifier() : super(0);

  change(int data) {
    state = data;
  }
}

final ProviderTabButtom = StateNotifierProvider<NumberNotifier, int>((ref) {
  return NumberNotifier();
});

final ProviderBottonNavegator =
    StateNotifierProvider<NumberNotifier, int>((ref) {
  return NumberNotifier();
});
