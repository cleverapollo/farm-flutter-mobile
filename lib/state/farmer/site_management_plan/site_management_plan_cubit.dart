import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'site_management_plan_state.dart';

class SiteManagementPlanCubit extends HydratedCubit<SiteManagementPlanState> {
  SiteManagementPlanCubit() : super(const SiteManagementPlanState());

  Future<void> initialize() async {
    try {
      emit(state.copyWith(loading: true));
      final activeFarm = await configService.getActiveFarm();

      if (activeFarm?.groupSchemeId != null) {
        getFarmType(activeFarm!.groupSchemeId!);
      }

      emit(state.copyWith(activeFarm: activeFarm));
      await refresh();
    } catch (error) {
      handleError(error);
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future getFarmType(int groupSchemeId) async {
    final groupSchemes = await cmoDatabaseMasterService.getGroupScheme();
    print("NGUYEN DEBUG selected groupSchemeId: $groupSchemeId");


    final groupScheme =
        await cmoDatabaseMasterService.getGroupSchemeById(groupSchemeId);
    print("NGUYEN DEBUG groupSchemeId: $groupSchemeId groupScheme: ${groupScheme?.groupSchemeId}");
    // if (groupScheme?.groupSchemeId == null) {
    //   return;
    // }
    //  final result = await cmoPerformApiService.fetchHirac(groupScheme?.hiracId!);
    // final groupSchemeFetcheds = await cmoPerformApiService.getGroupSchemeSearchByUserId();
    // print("NGUYEN DEBUG: ${groupSchemeFetcheds.toString()}");


    final result = await cmoPerformApiService.fetchHirac(0);
    print("NGUYEN DEBUG: ${result?.length}");
    // final hirac = await cmoDatabaseMasterService.getHiracById(groupScheme?.hiracId ?? 0);
    // if (hirac?.hiracId == null) {
    //   return;
    // }
    // final hiracTemplate = await cmoDatabaseMasterService.getHiracTemplateById(hirac?.hiracTemplateId ?? 0);
    // if (hiracTemplate?.hiracTemplateId == null) {
    //   return;
    // }
    // final hiracType = await cmoDatabaseMasterService.getHiracTypeByid(hiracTemplate?.hiracTypeId ?? 0);
  }



  Future<void> getTotalAnnualProductions() async {
    try {
      final service = cmoDatabaseMasterService;
      final farmId = state.activeFarm?.farmId;
      if (farmId == null) {
        return;
      }

      final data = await service.getAnnualFarmProductionByFarmId(farmId);
      emit(
        state.copyWith(
          totalAnnualFarmProductions: data.length,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    }
  }

  Future<void> getTotalAnnualBudgets() async {
    try {
      final service = cmoDatabaseMasterService;
      final farmId = state.activeFarm?.farmId;
      if (farmId == null) {
        emit(state.copyWith(loading: false));
        return;
      }

      final data = await service.getAnnualBudgetsByFarmId(farmId);

      emit(
        state.copyWith(
          totalAnnualBudgets: data.length,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    }
  }

  Future<void> getTotalCamp() async {
    final camps = await cmoDatabaseMasterService
        .getCampByFarmId(int.tryParse(state.activeFarm?.farmId ?? '') ?? 0);
    final total = camps.fold(0.0, (previousValue, element) => previousValue + (element.totalBiomass ?? 0.0));
    emit(state.copyWith(campCount: camps.length, campTonnesOfBiomass: total));
  }

  Future<void> refresh() async {
    await getTotalCamp();
    await getTotalAnnualProductions();
    await getTotalAnnualBudgets();
    await getCompartments();
  }

  Future getCompartments() async {
    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(state.activeFarm?.farmId ?? '');
    final total = compartments?.fold(0.0, (previousValue, element) => previousValue + (element.polygonArea ?? 0.0));
    emit(state.copyWith(compartmentCount: compartments?.length, compartmentTotalArea: total));
  }

  void handleError(Object error) {
    logger.d(error);
  }

  @override
  SiteManagementPlanState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(SiteManagementPlanState state) {
    return null;
  }
}
