import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'annual_budget_transactions_state.dart';

class AnnualBudgetTransactionsCubit extends HydratedCubit<AnnualBudgetTransactionsState> {
  AnnualBudgetTransactionsCubit() : super(const AnnualBudgetTransactionsState());

  Future<void> init(AnnualBudget? annualBudget,) async {
    emit(state.cleanCache());
    emit(
      state.copyWith(
        annualBudget: annualBudget,
      ),
    );

    await refresh();
  }

  Future<void> initAddUpdate({
    AnnualBudget? annualBudget,
    AnnualBudgetTransaction? annualBudgetTransaction,
    required bool isEditing,
  }) async {
    emit(state.cleanCache());
    emit(
      state.copyWith(
        annualBudget: annualBudget,
        isEditing: isEditing,
        annualBudgetTransaction: annualBudgetTransaction,
      ),
    );

    await loadListAnnualBudgetTransactionCategories();
  }

  Future<void> loadListAnnualBudgetTransactions() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final farmId = state.annualBudget?.farmId;
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
          selectedCategory: data.firstWhereOrNull(
            (element) =>
                element.annualBudgetTransactionCategoryId ==
                state.annualBudgetTransaction?.transactionCategoryId,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<int?> addUpdateTransaction(Map<String, dynamic> value) async {
    AnnualBudgetTransaction annualBudgetTransaction;

    if (state.isEditing) {
      annualBudgetTransaction = state.annualBudgetTransaction!;
    } else {
      annualBudgetTransaction = AnnualBudgetTransaction(
        annualBudgetTransactionId: DateTime.now().millisecondsSinceEpoch,
        annualBudgetId: state.annualBudget?.annualBudgetId,
      );
    }

    final annualBudgetTransactionCategory = value['TransactionCategory'] as AnnualBudgetTransactionCategory;
    annualBudgetTransaction = annualBudgetTransaction.copyWith(
      transactionCategoryId: annualBudgetTransactionCategory.annualBudgetTransactionCategoryId,
      transactionCategoryName: annualBudgetTransactionCategory.annualBudgetTransactionCategoryName,
      isIncome: state.indexTab == 0,
      transactionAmount: double.tryParse(value['Amount'].toString()),
      transactionDescription: value['TransactionDetail'].toString(),
    );

    if (state.selectedCategory?.isCalculated ?? false) {
      final amount = await getAmountBasedOnTransactionAttribute1(value['Amount'].toString());
      annualBudgetTransaction = annualBudgetTransaction.copyWith(
        transactionAttribute1: double.tryParse(value['Amount'].toString()),
        transactionAmount: amount,
      );
    }

    int? resultId;

    await (await cmoDatabaseMasterService.db).writeTxn(() async {
      resultId =
      await cmoDatabaseMasterService.cacheAnnualBudgetTransactions(annualBudgetTransaction);
      emit(state.copyWith(annualBudgetTransaction: annualBudgetTransaction));
    });

    return resultId;
  }

  void updateSelectedCategory(AnnualBudgetTransactionCategory? selectedCategory) {
    emit(state.copyWith(selectedCategory: selectedCategory));
  }

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
    applyFilters();
  }

  Future<double?> getAmountBasedOnTransactionAttribute1(String? input) async {
    if (input == null ||
        input.isEmpty ||
        state.selectedCategory?.annualBudgetTransactionCategoryCode == null ||
        state.annualBudget?.annualFarmProductionId == null) return null;

    final annualProduction = await cmoDatabaseMasterService.getAnnualFarmProductionById(
      state.annualBudget!.annualFarmProductionId!,
    );

    if (annualProduction == null) return null;

    if (state.selectedCategory?.annualBudgetTransactionCategoryCode == 'EXP002' ||
        state.selectedCategory?.annualBudgetTransactionCategoryCode ==
            'EXP003' ||
        state.selectedCategory?.annualBudgetTransactionCategoryCode ==
            'INC002') {
      return (double.tryParse(input) ?? 0) *
          annualProduction.calculatedAnnualCharcoalProductionPerTeam();
    } else if (state.selectedCategory?.annualBudgetTransactionCategoryCode ==
            'EXP005' ||
        state.selectedCategory?.annualBudgetTransactionCategoryCode ==
            'EXP006' ||
        state.selectedCategory?.annualBudgetTransactionCategoryCode ==
            'EXP007') {
      return (double.tryParse(input) ?? 0) * (annualProduction.noOfWorkers ?? 0);
    }

    return double.tryParse(input);
  }

  void loadIncomes() {
    emit(state.copyWith(loading: true));
    try {
      final data = state.listAnnualBudgetTransactions
          .where((element) => element.isIncome != null && element.isIncome!)
          .toList();
      emit(state.copyWith(filterAnnualBudgetTransactions: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void loadExpenses() {
    emit(state.copyWith(loading: true));
    try {
      final data = state.listAnnualBudgetTransactions
          .where((element) => element.isIncome != null && !element.isIncome!)
          .toList();
      emit(state.copyWith(filterAnnualBudgetTransactions: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void applyFilters() {
    switch (state.indexTab) {
      case 0:
        loadIncomes();
        break;
      case 1:
        loadExpenses();
        break;
      default:
        break;
    }
  }

  void searching(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterAnnualBudgetTransactions: state.listAnnualBudgetTransactions,
          ),
        );
        applyFilters();
      } else {
        final filteredItems = state.listAnnualBudgetTransactions.where((element) {
          final containName = element.transactionDescription
                  ?.toLowerCase()
                  .contains(searchText.toLowerCase()) ??
              false;

          var isFilter = false;
          switch (state.indexTab) {
            case 0:
              isFilter = element.isIncome != null && element.isIncome!;
              break;
            case 1:
              isFilter = element.isIncome != null && !element.isIncome!;
              break;
            default:
              break;
          }

          return containName && isFilter;
        }).toList();

        emit(
          state.copyWith(
            filterAnnualBudgetTransactions: filteredItems,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> refresh() async {
    await loadListAnnualBudgetTransactions();
    applyFilters();
  }

  Future<void> onRemoveTransaction(AnnualBudgetTransaction transaction) async {
    await cmoDatabaseMasterService.removeAnnualBudgetTransaction(transaction.annualBudgetTransactionId!);
    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${transaction.annualBudgetTransactionId}!',
    );

    await refresh();
  }

  void handleError(Object error) {
    logger.d(error);
  }

  @override
  AnnualBudgetTransactionsState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AnnualBudgetTransactionsState state) {
    return null;
  }
}
