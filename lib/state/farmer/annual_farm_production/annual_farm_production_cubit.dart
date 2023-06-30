import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'annual_farm_production_state.dart';

class AnnualFarmProductionCubit extends HydratedCubit<AnnualFarmProductionState> {
  AnnualFarmProductionCubit() : super(const AnnualFarmProductionState());

  Future<void> loadListWorkers() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;

      /// Replace farmID here
      final data = await service.getFarmerWorkersByFarmId(1553253093156);

      emit(
        state.copyWith(
          listWorkers: data,
          filterWorkers: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<bool> checkIfYearExists(int? year) async {
    try {
      final activeFarm = await configService.getActiveFarm();
      final listFarm = await cmoDatabaseMasterService.getAnnualFarmProductionByFarmIdAndYear(
        farmId: activeFarm?.farmId,
        year: year,
      );

      return listFarm.isNotBlank;
    } catch (error) {
      handleError(error);
      return true;
    }
  }

  void handleError(Object error) {
    logger.d(error);
  }

  @override
  AnnualFarmProductionState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AnnualFarmProductionState state) {
    return null;
  }
}
