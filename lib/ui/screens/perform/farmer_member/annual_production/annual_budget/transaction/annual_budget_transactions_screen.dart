import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/transaction/add_update_annual_budget_transaction_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/status_button.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnualBudgetTransactionsScreen extends StatefulWidget {
  const AnnualBudgetTransactionsScreen({
    super.key,
    required this.annualBudget,
  });

  final AnnualBudget annualBudget;

  @override
  State<StatefulWidget> createState() => _AnnualBudgetTransactionsScreenState();

  static void push(
    BuildContext context, {
    required AnnualBudget annualBudget,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AnnualBudgetTransactionsScreen(
          annualBudget: annualBudget,
        ),
      ),
    );
  }
}

class _AnnualBudgetTransactionsScreenState
    extends State<AnnualBudgetTransactionsScreen> {
  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AnnualBudgetTransactionsCubit>().init(
            widget.annualBudget,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.transactions.tr(),
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddUpdateAnnualBudgetTransactionScreen.push(
          context,
          selectedAnnualBudget: widget.annualBudget,
        ),
      ),
      body: BlocSelector<AnnualBudgetTransactionsCubit,
          AnnualBudgetTransactionsState, AnnualBudgetTransactionsState>(
        selector: (state) => state,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                child: CmoTextField(
                  name: LocaleKeys.search.tr(),
                  hintText: LocaleKeys.search.tr(),
                  suffixIcon: Assets.icons.icSearch.svg(),
                  onChanged: (input) {
                    _debounceInputTimer?.cancel();
                    _debounceInputTimer = Timer(
                      const Duration(milliseconds: 200),
                      () => context
                          .read<AnnualBudgetTransactionsCubit>()
                          .searching(input),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: BlocSelector<AnnualBudgetTransactionsCubit,
                    AnnualBudgetTransactionsState, int>(
                  selector: (state) {
                    return state.indexTab;
                  },
                  builder: (context, indexTab) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StatusButton(
                          onTap: () => context
                              .read<AnnualBudgetTransactionsCubit>()
                              .changeIndexTab(0),
                          isDisable: indexTab != 0,
                          title: LocaleKeys.income.tr(),
                        ),
                        StatusButton(
                          onTap: () => context
                              .read<AnnualBudgetTransactionsCubit>()
                              .changeIndexTab(1),
                          isDisable: indexTab != 1,
                          title: LocaleKeys.expense.tr(),
                        ),
                      ].withSpaceBetween(width: 20),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: state.filterAnnualBudgetTransactions.length,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => AddUpdateAnnualBudgetTransactionScreen.push(
                        context,
                        isEditing: true,
                        selectedAnnualBudgetTransaction: state.filterAnnualBudgetTransactions[index],
                        selectedAnnualBudget: state.annualBudget,
                      ),
                      child: _buildItemCard(
                        state.filterAnnualBudgetTransactions[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItemCard(AnnualBudgetTransaction model) {
    return Dismissible(
      key: Key(model.id.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (test) async {
        final shouldRemoved = await showDefaultAlert(
          context,
          title: LocaleKeys.removeAnnualBudgetTransaction.tr(),
          content: LocaleKeys.removeAnnualBudgetTransactionAlertContent.tr(),
          actions: <Widget>[
            TextButton(
              child: Text(LocaleKeys.ok.tr().toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text(LocaleKeys.cancel.tr().toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
        if (shouldRemoved != true) {
          return;
        }

        await context
            .read<AnnualBudgetTransactionsCubit>()
            .onRemoveTransaction(model);

        await context.read<AnnualBudgetManagementCubit>().loadListAnnualBudgets();
        return null;
      },
      background: Container(
        color: context.colors.red,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          LocaleKeys.remove.tr(),
          style: context.textStyles.bodyBold.white,
        ),
      ),
      child: CmoCard(
        padding: const EdgeInsets.only(bottom: 20),
        content: [
          CmoCardHeader(
            title: model.transactionDescription ?? '',
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          CmoCardItem(
            title: LocaleKeys.transactionCategory.tr(),
            value: model.transactionCategoryName ?? '',
          ),
          CmoCardItem(
            title: LocaleKeys.amount.tr(),
            value: model.transactionAmount?.toStringAsFixed(2) ?? '000',
          ),
        ],
      ),
    );
  }
}
