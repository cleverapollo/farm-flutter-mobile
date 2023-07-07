import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
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
      await refresh();

    } catch (error) {
      handleError(error);
    } finally {
      emit(state.copyWith(loading: false));
    }
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

  Future<void> refresh() async {
    await getTotalAnnualProductions();
    await getTotalAnnualBudgets();
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
