import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/widget/farmer_sync_summary_widget.dart';
import 'package:flutter/material.dart';

enum FarmerSyncSummaryEnum {
  workers,
  registers,
  annualProductions,
  annualBudgets,
  annualBudgetTransactions,
  camps,
  scheduler,
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
      case FarmerSyncSummaryEnum.scheduler:
        return const FarmerSyncSummaryWidget(
            type: FarmerSyncSummaryEnum.scheduler);
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
        scheduler.getView,
        masterData.getView,
        stakeHolder.getView,
      ];
    }
    return <Widget>[];
  }

  String get getLabel {
    switch (this) {
      case FarmerSyncSummaryEnum.workers:
        return 'Workers';
      case FarmerSyncSummaryEnum.registers:
        return 'Registers';
      case FarmerSyncSummaryEnum.annualProductions:
        return 'Annual Productions';
      case FarmerSyncSummaryEnum.annualBudgets:
        return 'Annual Budgets';
      case FarmerSyncSummaryEnum.annualBudgetTransactions:
        return 'Annual Budget Transactions';
      case FarmerSyncSummaryEnum.camps:
        return 'Camps';
      case FarmerSyncSummaryEnum.scheduler:
        return 'Scheduler';
      case FarmerSyncSummaryEnum.masterData:
        return 'Master Data';
      case FarmerSyncSummaryEnum.stakeHolder:
        return 'Stake Holder';
      case FarmerSyncSummaryEnum.all:
        return '';
    }
  }
}
