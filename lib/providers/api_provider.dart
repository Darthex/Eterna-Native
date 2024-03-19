import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiNotifier extends StateNotifier<String> {
  ApiNotifier() : super('');

// void addPlace(String title, File image) {
//   final newPlace = PlaceModel(title: title, image: image);
//   state = [newPlace, ...state];
// }
  void addApi(String api) {
    state = api.toString();
  }
}

final apiProvider =
    StateNotifierProvider<ApiNotifier, String>((ref) => ApiNotifier());
