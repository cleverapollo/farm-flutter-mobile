part of 'aai_cubit.dart';

class AAIState {
  const AAIState({
     this.filteredItems = const [],
     this.items = const [],
    this.isLoading = false,
  });

  final List<AccidentAndIncident> filteredItems;
  final List<AccidentAndIncident> items;
  final bool isLoading;

  AAIState copyWith({
    List<AccidentAndIncident>? filteredItems,
    List<AccidentAndIncident>? items,
    bool? isLoading,
  }) {
    return AAIState(
      filteredItems: filteredItems ?? this.filteredItems,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
