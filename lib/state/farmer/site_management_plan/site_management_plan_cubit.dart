import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/hirac.dart';
import 'package:cmo/model/hirac_template.dart';
import 'package:cmo/model/hirac_type.dart';
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
      emit(state.copyWith(activeFarm: activeFarm));
      if (activeFarm?.groupSchemeId != null) {
        final isCharcoal = await isCharcoalFarm(activeFarm!.groupSchemeId!);
        emit(state.copyWith(isCharcoalFarm: isCharcoal));
      }
      await refresh();
    } catch (error) {
      handleError(error);
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<bool> isCharcoalFarm(int groupSchemeId) async {
    final result = await Future.wait(
      [
        cmoPerformApiService.getGroupSchemeByGroupSchemeId(groupSchemeId),
        cmoPerformApiService.getHiracSearch(),
        cmoPerformApiService.getHiracTemplateSearch(),
        cmoPerformApiService.getHiracTypeSearch()
      ],
    );
    final groupSchemes = result[0] as List<GroupScheme>?;
    final hiracs = result[1] as List<Hirac>?;
    final hiracTemplates = result[2] as List<HiracTemplate>?;
    final hiracTypes = result[3] as List<HiracType>?;
    if (groupSchemes?.isEmpty ?? false) {
      return true;
    }
    if (hiracs?.isEmpty ?? false) {
      return true;
    }
    if (hiracTemplates?.isEmpty ?? false) {
      return true;
    }
    if (hiracTypes?.isEmpty ?? false) {
      return true;
    }
    final hiracId = groupSchemes!.first.hiracId ?? 0;
    final hirac = hiracs.firstWhereOrNull((e) => e.id == hiracId);
    if (hirac == null) {
      return true;
    }
    final hiracTemplate = hiracTemplates.firstWhereOrNull((element) => element.hiracTemplateId == hirac.hiracTemplateId);
    if (hiracTemplate == null) {
      return true;
    }
    final hiracType = hiracTypes.firstWhereOrNull((element) => element.hiracTypeId == hiracTemplate.hiracTypeId);
    if (hiracType?.hiracTypeName?.toLowerCase() == 'plantation') {
      return false;
    }
    return true;
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
