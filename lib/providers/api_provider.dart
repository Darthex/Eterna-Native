import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiNotifier extends StateNotifier<String> {
  ApiNotifier() : super('');

  void addApi(String api) {
    state = api.toString();
  }
}

final apiProvider =
    StateNotifierProvider<ApiNotifier, String>((ref) => ApiNotifier());
