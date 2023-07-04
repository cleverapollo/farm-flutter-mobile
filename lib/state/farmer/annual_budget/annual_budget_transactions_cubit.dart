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

    await loadListAnnualBudgetTransactionCategories();
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
      final data =
          await cmoDatabaseMasterService.getAnnualBudgetTransactionCategory();
      if (data.isEmpty) {
        data.add(
          AnnualBudgetTransactionCategory(
            annualBudgetTransactionCategoryCode: 'EXP005',
            annualBudgetTransactionCategoryId: 1,
            annualBudgetTransactionCategoryName: 'Category',
          ),
        );
      }
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
      // transactionAttribute1: ,
    );

    int? resultId;

    await (await cmoDatabaseMasterService.db).writeTxn(() async {
      resultId =
      await cmoDatabaseMasterService.cacheAnnualBudgetTransactions(annualBudgetTransaction);
      emit(state.copyWith(annualBudgetTransaction: annualBudgetTransaction));
    });

    return resultId;
  }

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
    applyFilters();
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

    await loadListAnnualBudgetTransactions();
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
