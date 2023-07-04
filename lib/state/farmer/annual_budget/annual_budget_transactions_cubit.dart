import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'annual_budget_transactions_state.dart';

class AnnualBudgetTransactionsCubit extends HydratedCubit<AnnualBudgetTransactionsState> {
  AnnualBudgetTransactionsCubit() : super(const AnnualBudgetTransactionsState());

  Future<void> init(AnnualBudget? annualBudget,) async {
    final activeFarm = await configService.getActiveFarm();
    emit(
      state.copyWith(
        activeFarm: activeFarm,
        annualBudget: annualBudget,
      ),
    );

    await loadListAnnualBudgetTransactions();
    await loadListAnnualBudgetTransactionCategories();
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

  Future<void> loadListAnnualBudgetTransactions() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final farmId = state.activeFarm?.farmId;
      if (farmId == null) {
        emit(state.copyWith(loading: false));
        return;
      }

      final data = await service.getAnnualBudgetTransactionByBudgetId(state.annualBudget!.annualBudgetId!);
      emit(
        state.copyWith(
          filterAnnualBudgetTransactions: data,
          listAnnualBudgetTransactions: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> loadListAnnualBudgetTransactionCategories() async {
    emit(state.copyWith(loading: true));
    try {
      final data = await cmoDatabaseMasterService.getAnnualBudgetTransactionCategory();
      emit(
        state.copyWith(
          listAnnualBudgetTransactionCategories: data,
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
          filterAnnualBudgetTransactions: state.listAnnualBudgetTransactions,
        ),
      );
    } else {
      emit(
        state.copyWith(
          filterAnnualBudgetTransactions: state.listAnnualBudgetTransactions
              .where((element) =>
          element.transactionDescription
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

    await loadListAnnualBudgetTransactions();
  }

  void handleError(Object error) {
    logger.d(error);
  }

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
    applyFilters();
  }

  // void loadIncomplete() {
  //   emit(state.copyWith(loading: true));
  //   try {
  //     final data = state.listAudits
  //         .where((element) => element.completed == false)
  //         .toList();
  //     emit(state.copyWith(filterAudits: data));
  //   } catch (e) {
  //     emit(state.copyWith(error: e));
  //     showSnackError(msg: e.toString());
  //   } finally {
  //     emit(state.copyWith(loading: false));
  //   }
  // }
  //
  // void loadCompleted() {
  //   emit(state.copyWith(loading: true));
  //   try {
  //     final data = state.listAudits
  //         .where(
  //           (element) => element.completed == true && element.synced == false,
  //     )
  //         .toList();
  //     emit(state.copyWith(filterAudits: data));
  //   } catch (e) {
  //     emit(state.copyWith(error: e));
  //     showSnackError(msg: e.toString());
  //   } finally {
  //     emit(state.copyWith(loading: false));
  //   }
  // }
  //
  // void loadSynced() {
  //   emit(state.copyWith(loading: true));
  //   try {
  //     final data = state.listAudits
  //         .where(
  //           (element) => element.completed == true && element.synced == true,
  //     )
  //         .toList();
  //     emit(state.copyWith(filterAudits: data));
  //   } catch (e) {
  //     emit(state.copyWith(error: e));
  //     showSnackError(msg: e.toString());
  //   } finally {
  //     emit(state.copyWith(loading: false));
  //   }
  // }
  //
  // Future<void> loadListAudits() async {
  //   emit(state.copyWith(loading: true));
  //   try {
  //     final service = cmoDatabaseMasterService;
  //     final data = await service.getAllAudits();
  //     emit(state.copyWith(listAudits: data));
  //   } catch (e) {
  //     emit(state.copyWith(error: e));
  //     showSnackError(msg: e.toString());
  //   } finally {
  //     emit(state.copyWith(loading: false));
  //   }
  // }
  //
  // Future<void> removeAudit(Audit item, {VoidCallback? callback}) async {
  //   await cmoDatabaseMasterService.removeAudit(item.assessmentId!);
  //   showSnackSuccess(
  //     msg: '${LocaleKeys.removeAudit.tr()} ${item.assessmentId}!',
  //   );
  //
  //   callback?.call();
  //   await refresh();
  // }

  Future<void> refresh() async {
    // await loadListAudits();
    applyFilters();
  }

  void applyFilters() {
    switch (state.indexTab) {
      case 0:
        // loadIncomplete();
        break;
      case 1:
        // loadCompleted();
        break;
      case 2:
        // loadSynced();
        break;
      default:
        break;
    }
  }

  // void searching(String? searchText) {
  //   emit(state.copyWith(loading: true));
  //   try {
  //     if (searchText == null || searchText.isEmpty) {
  //       emit(
  //         state.copyWith(
  //           filterAudits: state.listAudits,
  //         ),
  //       );
  //       applyFilters();
  //     } else {
  //       final filteredItems = state.listAudits.where((element) {
  //         final containName = (element.compartmentName
  //             ?.toLowerCase()
  //             .contains(searchText.toLowerCase()) ??
  //             false) ||
  //             (element.auditTemplateName
  //                 ?.toLowerCase()
  //                 .contains(searchText.toLowerCase()) ??
  //                 false) ||
  //             (element.farmName
  //                 ?.toLowerCase()
  //                 .contains(searchText.toLowerCase()) ??
  //                 false);
  //
  //         var isFilter = false;
  //         switch (state.indexTab) {
  //           case 0:
  //             isFilter = element.completed == false;
  //             break;
  //           case 1:
  //             isFilter = element.completed == true && element.synced == false;
  //             break;
  //           case 2:
  //             isFilter = element.completed == true && element.synced == true;
  //             break;
  //           default:
  //             break;
  //         }
  //
  //         return containName && isFilter;
  //       }).toList();
  //
  //       emit(
  //         state.copyWith(
  //           filterAudits: filteredItems,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(error: e));
  //     showSnackError(msg: e.toString());
  //   } finally {
  //     emit(state.copyWith(loading: false));
  //   }
  // }

  @override
  AnnualBudgetTransactionsState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AnnualBudgetTransactionsState state) {
    return null;
  }
}
