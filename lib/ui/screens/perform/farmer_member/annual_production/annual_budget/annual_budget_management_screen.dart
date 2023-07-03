import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/add_update_budget/add_update_annual_budget_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnualBudgetManagementScreen extends StatefulWidget {
  const AnnualBudgetManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AnnualBudgetManagementScreenState();

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AnnualBudgetManagementScreen(),
      ),
    );
  }
}

class _AnnualBudgetManagementScreenState
    extends State<AnnualBudgetManagementScreen> {
  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AnnualBudgetManagementCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnnualBudgetManagementCubit,
        AnnualBudgetManagementState, AnnualBudgetManagementState>(
      selector: (state) => state,
      builder: (context, state) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.annualBudgets.tr(),
            subtitle: state.activeFarm?.farmName ?? '',
            subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
            leading: Assets.icons.icArrowLeft.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icAdd.svgBlack,
            onTapTrailing: () => AddAnnualBudgetScreen.push(context),
          ),
          body: Column(
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
                          .read<AnnualBudgetManagementCubit>()
                          .searching(input),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.filterAnnualBudgets.length,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return _buildItemCard(state.filterAnnualBudgets[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemCard(AnnualBudget model) {
    return CmoTappable(
      onTap: () => AddAnnualBudgetScreen.push(
        context,
        isEditing: true,
        selectedAnnualBudget: model,
      ),
      child: Dismissible(
        key: Key(model.id.toString()),
        direction: DismissDirection.endToStart,
          confirmDismiss: (test) async {
            final shouldRemoved = await showDefaultAlert(
              context,
              title: LocaleKeys.removeAnnualBudget.tr(),
              content: LocaleKeys.removeAnnualBudgetAlertContent.tr(),
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

            await context.read<AnnualBudgetManagementCubit>().onRemoveBudget(model);
            return null;
          },
          background: Container(
            color: context.colors.red,
            alignment: Alignment.center,
            child: Text(
              LocaleKeys.remove.tr(),
              style: context.textStyles.bodyBold.white,
            ),
          ),
        child: CmoCard(
          padding: const EdgeInsets.only(bottom: 20),
          content: [
            CmoCardHeader(
              title: model.annualBudgetName ?? '',
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            CmoCardItem(
              title: LocaleKeys.profitLoss.tr(),
              value: model.profitAndLoss().toStringAsFixed(2),
            ),
            CmoCardItem(
              title: LocaleKeys.income.tr(),
              value: model.totalIncome?.toStringAsFixed(2) ?? '000',
            ),
            CmoCardItem(
              title: LocaleKeys.expenses.tr(),
              value: model.totalExpense?.toStringAsFixed(2) ?? '000',
            ),
          ],
        ),
      ),
    );
  }
}
