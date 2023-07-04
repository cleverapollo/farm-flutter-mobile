import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'annual_budget_management_state.dart';

class AnnualBudgetManagementCubit extends HydratedCubit<AnnualBudgetManagementState> {
  AnnualBudgetManagementCubit() : super(const AnnualBudgetManagementState());

  Future<void> init() async {
    final activeFarm = await configService.getActiveFarm();
    emit(state.copyWith(activeFarm: activeFarm));
    await loadListAnnualBudgets();
  }

  Future<void> initAddUpdate({
    AnnualBudget? annualBudget,
    required bool isEditing,
  }) async {
    emit(state.cleanCache());
    final activeFarm = await configService.getActiveFarm();
    emit(
      state.copyWith(
        activeFarm: activeFarm,
        annualBudget: annualBudget,
        isEditing: isEditing,
      ),
    );

    await loadListAnnualFarmProductions();
  }

  Future<void> loadListAnnualBudgets() async {
    emit(state.copyWith(loading: true));
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
          filterAnnualBudgets: data,
          listAnnualBudgets: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
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
          filterAnnualBudgets: state.listAnnualBudgets,
        ),
      );
    } else {
      emit(
        state.copyWith(
          filterAnnualBudgets: state.listAnnualBudgets
              .where((element) =>
          element.annualBudgetName
              ?.toString()
              .toLowerCase()
              .contains(input.toLowerCase()) ??
              false)
              .toList(),
        ),
      );
    }
  }

  Future<int?> addReplaceAnnualBudget(Map<String, dynamic> value) async {
    AnnualBudget annualBudget;

    if (state.isEditing) {
      annualBudget = state.annualBudget!;
    } else {
      annualBudget = AnnualBudget(
        farmId: state.activeFarm?.farmId,
        annualBudgetId: DateTime.now().millisecondsSinceEpoch.toString(),
        groupSchemeId: state.activeFarm?.groupSchemeId,
        annualFarmProductionId: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }

    final annualFarmProduction = value['AnnualFarmProduction'] as AnnualFarmProduction;
    annualBudget = annualBudget.copyWith(
      annualBudgetName: value['AnnualBudgetName'].toString(),
      annualFarmProductionYear: annualFarmProduction.year,
      annualFarmProductionId: annualFarmProduction.annualFarmProductionId,
    );

    int? resultId;

    await (await cmoDatabaseMasterService.db).writeTxn(() async {
      resultId =
          await cmoDatabaseMasterService.cacheAnnualBudgets(annualBudget);
      emit(state.copyWith(annualBudget: annualBudget));
    });

    return resultId;
  }

  Future<void> onRemoveBudget(AnnualBudget budget) async {
    await cmoDatabaseMasterService.removeAnnualBudget(budget.id);
    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${budget.annualBudgetId}!',
    );

    await loadListAnnualBudgets();
  }

  void handleError(Object error) {
    logger.d(error);
  }

  @override
  AnnualBudgetManagementState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AnnualBudgetManagementState state) {
    return null;
  }
}
