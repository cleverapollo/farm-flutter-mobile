import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/widget/farmer_sync_summary_widget.dart';
import 'package:flutter/material.dart';

enum FarmerSyncSummaryEnum {
  workers,
  registers,
  annualProductions,
  annualBudgets,
  annualBudgetTransactions,
  camps,
  // scheduler,
  masterData,
  stakeHolder,
  all;

  const FarmerSyncSummaryEnum();

  Widget get getView {
    switch (this) {
      case FarmerSyncSummaryEnum.workers:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.workers);
      case FarmerSyncSummaryEnum.registers:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.registers);
      case FarmerSyncSummaryEnum.annualProductions:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.annualProductions);
      case FarmerSyncSummaryEnum.annualBudgets:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.annualBudgets);
      case FarmerSyncSummaryEnum.annualBudgetTransactions:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.annualBudgetTransactions);
      case FarmerSyncSummaryEnum.camps:
        return const FarmerSyncSummaryWidget(type: FarmerSyncSummaryEnum.camps);
      // case FarmerSyncSummaryEnum.scheduler:
      //   return const FarmerSyncSummaryWidget(
      //       type: FarmerSyncSummaryEnum.scheduler);
      case FarmerSyncSummaryEnum.masterData:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.masterData);
      case FarmerSyncSummaryEnum.stakeHolder:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.stakeHolder);
      case FarmerSyncSummaryEnum.all:
        return const SizedBox();
    }
  }

  List<Widget> get getViews {
    if (this == FarmerSyncSummaryEnum.all) {
      return <Widget>[
        workers.getView,
        registers.getView,
        annualProductions.getView,
        annualBudgets.getView,
        annualBudgetTransactions.getView,
        camps.getView,
        // scheduler.getView,
        masterData.getView,
        stakeHolder.getView,
      ];
    }
    return <Widget>[];
  }

  String get getLabel {
    switch (this) {
      case FarmerSyncSummaryEnum.workers:
        return LocaleKeys.workers.tr();
      case FarmerSyncSummaryEnum.registers:
        return LocaleKeys.registers.tr();
      case FarmerSyncSummaryEnum.annualProductions:
        return LocaleKeys.annual_productions.tr();
      case FarmerSyncSummaryEnum.annualBudgets:
        return LocaleKeys.annualBudgets.tr();
      case FarmerSyncSummaryEnum.annualBudgetTransactions:
        return LocaleKeys.annual_budget_transactions.tr();
      case FarmerSyncSummaryEnum.camps:
        return LocaleKeys.camps.tr();
      // case FarmerSyncSummaryEnum.scheduler:
      //   return LocaleKeys.scheduler.tr();
      case FarmerSyncSummaryEnum.masterData:
        return LocaleKeys.master_data.tr();
      case FarmerSyncSummaryEnum.stakeHolder:
        return LocaleKeys.stakeholders.tr();
      case FarmerSyncSummaryEnum.all:
        return '';
    }
  }
}
