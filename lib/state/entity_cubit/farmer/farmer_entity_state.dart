import 'package:cmo/model/farm.dart';

class FarmerEntityState {
  const FarmerEntityState({
    this.isLoading = false,
    this.farms = const [],
    this.selectedFarm,
  });

  final bool isLoading;
  final List<Farm> farms;
  final Farm? selectedFarm;

  FarmerEntityState copyWith({
    bool? isLoading,
    List<Farm>? farms,
    Farm? selectedFarm,
  }) {
    return FarmerEntityState(
      isLoading: isLoading ?? this.isLoading,
      farms: farms ?? this.farms,
      selectedFarm: selectedFarm ?? this.selectedFarm,
    );
  }
}
