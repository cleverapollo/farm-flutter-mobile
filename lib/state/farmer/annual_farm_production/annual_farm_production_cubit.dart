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

  Future<int?> addReplaceAnnualFarmProduction(Map<String, dynamic> value) async {
    final activeFarm = await configService.getActiveFarm();
    var annualProduction = AnnualFarmProduction(
      farmId: activeFarm?.farmId,
      annualFarmProductionId: DateTime.now().millisecondsSinceEpoch.toString(),
      year: int.tryParse(value['Year'].toString()),
      noOfWorkers: double.tryParse(value['noOfWorkers'].toString()),
      workPeriodMonths: double.tryParse(value['WorkPeriodMonths'].toString()),
      workPeriodWeeks: double.tryParse(value['WorkPeriodMonths'].toString())! * 4.33,
      cycleLength: double.tryParse(value['CycleLength'].toString()),
      productionPerCycle: double.tryParse(value['ProductionPerCycle'].toString()),
      conversionWoodToCharcoal: double.tryParse(value['ConversionWoodToCharcoal'].toString()),
      createDT: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    annualProduction = annualProduction.copyWith(
      noOfCycles: annualProduction.calculateNoOfCycles(isRound: true),
      annualWoodBiomassRemoved: annualProduction.calculateAnnualWoodBiomassRemoved(isRound: true),
      annualCharcoalProductionPerPerson: annualProduction.calculatedAnnualCharcoalProductionPerPerson(isRound: true),
      annualCharcoalProductionPerTeam: annualProduction.calculatedAnnualCharcoalProductionPerTeam(isRound: true),
    );

    int? resultId;

    await (await cmoDatabaseMasterService.db).writeTxn(() async {
      resultId = await cmoDatabaseMasterService.cacheAnnualProduction(annualProduction);
    });

    return resultId;
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
