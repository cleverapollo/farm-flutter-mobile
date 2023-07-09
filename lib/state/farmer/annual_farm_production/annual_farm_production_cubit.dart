import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'annual_farm_production_state.dart';

class AnnualFarmProductionCubit
    extends HydratedCubit<AnnualFarmProductionState> {
  AnnualFarmProductionCubit() : super(const AnnualFarmProductionState());

  Future<void> init() async {
    final activeFarm = await configService.getActiveFarm();
    emit(state.copyWith(activeFarm: activeFarm));
    await loadListAnnualFarmProductions();
  }

  Future<void> initAddUpdate({
    AnnualFarmProduction? annualFarmProduction,
    required bool isEditing,
  }) async {
    emit(state.cleanCache());
    final activeFarm = await configService.getActiveFarm();
    emit(
      state.copyWith(
        activeFarm: activeFarm,
        annualFarmProduction: annualFarmProduction,
        isEditing: isEditing,
      ),
    );
  }

  Future<void> loadListAnnualFarmProductions() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final farmId = state.activeFarm?.farmId;
      if (farmId == null) {
        emit(state.copyWith(loading: false));
        return;
      }

      final data = await service.getAnnualFarmProductionByFarmId(farmId);
      emit(
        state.copyWith(
          filterAnnualFarmProductions: data,
          listAnnualFarmProductions: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void searching(String? input) {
    if (input == null || input.isEmpty) {
      emit(
        state.copyWith(
          filterAnnualFarmProductions: state.listAnnualFarmProductions,
        ),
      );
    } else {
      emit(
        state.copyWith(
          filterAnnualFarmProductions: state.listAnnualFarmProductions
              .where((element) =>
                  element.year
                      ?.toString()
                      .toLowerCase()
                      .contains(input.toLowerCase()) ??
                  false)
              .toList(),
        ),
      );
    }
  }

  Future<bool> checkIfYearExists(int? year) async {
    try {
      final activeFarm = await configService.getActiveFarm();
      final listFarm =
          await cmoDatabaseMasterService.getAnnualFarmProductionByFarmIdAndYear(
        farmId: activeFarm?.farmId,
        year: year,
      );

      return listFarm.isNotBlank;
    } catch (error) {
      handleError(error);
      return true;
    }
  }

  Future<int?> addReplaceAnnualFarmProduction(
      Map<String, dynamic> value) async {
    AnnualFarmProduction annualProduction;

    if (state.isEditing) {
      annualProduction = state.annualFarmProduction!;
    } else {
      annualProduction = AnnualFarmProduction(
        farmId: state.activeFarm?.farmId,
        annualFarmProductionId:
            DateTime.now().millisecondsSinceEpoch.toString(),
        createDT: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }

    annualProduction = annualProduction.copyWith(
      year: int.tryParse(value['Year'].toString()).toString(),
      noOfWorkers: double.tryParse(value['noOfWorkers'].toString()),
      workPeriodMonths: double.tryParse(value['WorkPeriodMonths'].toString()),
      workPeriodWeeks:
          double.tryParse(value['WorkPeriodMonths'].toString())! * 4.33,
      cycleLength: double.tryParse(value['CycleLength'].toString()),
      productionPerCycle:
          double.tryParse(value['ProductionPerCycle'].toString()),
      conversionWoodToCharcoal:
          double.tryParse(value['ConversionWoodToCharcoal'].toString()),
    );

    annualProduction = annualProduction.copyWith(
      noOfCycles: annualProduction.calculateNoOfCycles(isRound: true),
      annualWoodBiomassRemoved:
          annualProduction.calculateAnnualWoodBiomassRemoved(isRound: true),
      annualCharcoalProductionPerPerson: annualProduction
          .calculatedAnnualCharcoalProductionPerPerson(isRound: true),
      annualCharcoalProductionPerTeam: annualProduction
          .calculatedAnnualCharcoalProductionPerTeam(isRound: true),
    );

    int? resultId;

    await (await cmoDatabaseMasterService.db).writeTxn(() async {
      resultId = await cmoDatabaseMasterService
          .cacheAnnualProduction(annualProduction);
      emit(state.copyWith(annualFarmProduction: annualProduction));
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
