import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataProviderNotifier extends StateNotifier<List> {
  DataProviderNotifier() : super(const []);

  void appendList(List items) {
    state = [...state, ...items];
  }

  void removeList() {
    final newList = state.sublist(0, state.length - 1);
    state = [...newList];
  }
}

final dataProvider = StateNotifierProvider<DataProviderNotifier, List>(
    (ref) => DataProviderNotifier());
