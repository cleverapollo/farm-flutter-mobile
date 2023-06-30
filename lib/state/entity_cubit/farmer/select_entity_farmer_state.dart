import 'package:cmo/model/model.dart';

class SelectEntityFarmerState {
  const SelectEntityFarmerState({
    this.isLoading = false,
    this.farms = const [],
    this.selectedFarm,
  });

  final bool isLoading;
  final List<Farm> farms;
  final Farm? selectedFarm;

  SelectEntityFarmerState copyWith({
    bool? isLoading,
    List<Farm>? farms,
    Farm? selectedFarm,
  }) {
    return SelectEntityFarmerState(
      isLoading: isLoading ?? this.isLoading,
      farms: farms ?? this.farms,
      selectedFarm: selectedFarm ?? this.selectedFarm,
    );
  }
}
