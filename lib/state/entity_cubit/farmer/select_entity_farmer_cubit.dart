import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/entity_cubit/farmer/select_entity_farmer_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SelectEntityFarmerCubit extends Cubit<SelectEntityFarmerState> {

  SelectEntityFarmerCubit(): super(const SelectEntityFarmerState());

  Future<void> fetchFarms() async {
    emit(state.copyWith(isLoading: true));
    final farms = await cmoPerformApiService.fetchFarms();
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