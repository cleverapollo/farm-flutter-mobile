import 'package:cmo/di.dart';
import 'package:cmo/model/farm.dart';
import 'package:cmo/state/entity_cubit/farmer/farmer_entity_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class FarmerEntityCubit extends Cubit<FarmerEntityState> {

  FarmerEntityCubit(): super(const FarmerEntityState());

  Future<void> fetchFarms({
    required BuildContext context,
  }) async {
    emit(state.copyWith(isLoading: true));
    List<Farm>? farms;
    if (context.mounted) {
      farms = await cmoApiService.fetchFarms();
    }
    emit(
      state.copyWith(
        isLoading: false,
        farms: farms,
      ),
    );
  }

  void setSelectedFarm(Farm selectedFarm) {
    emit(
      state.copyWith(
        selectedFarm: selectedFarm,
      ),
    );
  }
}