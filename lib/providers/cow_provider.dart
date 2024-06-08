import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newlivestock/models/cow.dart';

// Provider to hold the list of cows
final cowsProvider = StateNotifierProvider<CowNotifier, List<Cow>>((ref) {
  return CowNotifier([]);
});

class CowNotifier extends StateNotifier<List<Cow>> {
  CowNotifier(List<Cow> list) : super(list);

  void addCow(Cow cow) {
    state = [...state, cow]; // Add cow to the list using the spread operator
  }

  void updateCow(String id, String gender, String weight, String pubertyDate,
      String dateOfCulling, String remarks) {
    final index = state.indexWhere((cow) => cow.id == id);
    if (index >= 0) {
      // Update specific properties using copyWith
      final updatedCow = state[index].copyWith(
        gender: gender,
        weight: weight,
        puberty: pubertyDate,
        dateOfCulling: dateOfCulling,
        remarks: remarks,
      );
      // Update the state with the modified cow
      state = [
        ...state.sublist(0, index),
        updatedCow,
        ...state.sublist(index + 1),
      ];
    }
  }
}
