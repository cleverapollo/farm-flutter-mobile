part of 'biological_control_cubit.dart';

class BiologicalControlState {
  BiologicalControlState({
   this.items = const [],
   this.filteredItems = const []
  });

  final List<BiologicalControlAgent> items;
  final List<BiologicalControlAgent> filteredItems;

  BiologicalControlState copyWith({
     List<BiologicalControlAgent>? items,
     List<BiologicalControlAgent>? filteredItems
  }) {
    return BiologicalControlState(
      items:items ?? this.items,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}
