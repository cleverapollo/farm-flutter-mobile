import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/add_new_annual/add_new_annual_production_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/add_budget/add_annual_budget_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<AnnualProductionBudget> _mockData = [
  AnnualProductionBudget(
    year: 2022,
    annualBudgetId: DateTime.now().millisecondsSinceEpoch,
    annualBudgetName: 'Annual Budget Name 1',
    annualProductionId: DateTime.now().millisecondsSinceEpoch,
    farmId: DateTime.now().millisecondsSinceEpoch,
    balanceAmount: 1000,
    expenseAmount: 101.11,
    incomeAmount: 3033.22,
  ),
  AnnualProductionBudget(
    year: 2023,
    annualBudgetId: DateTime.now().millisecondsSinceEpoch,
    annualBudgetName: 'Annual Budget Name 2',
    annualProductionId: DateTime.now().millisecondsSinceEpoch,
    farmId: DateTime.now().millisecondsSinceEpoch,
    balanceAmount: 1000,
    expenseAmount: 101.11,
    incomeAmount: 3033.22,
  ),
  AnnualProductionBudget(
    year: 2024,
    annualBudgetId: DateTime.now().millisecondsSinceEpoch,
    annualBudgetName: 'Annual Budget Name 3',
    annualProductionId: DateTime.now().millisecondsSinceEpoch,
    farmId: DateTime.now().millisecondsSinceEpoch,
    balanceAmount: 1000,
    expenseAmount: 101.11,
    incomeAmount: 3033.22,
  ),
  AnnualProductionBudget(
    year: 2025,
    annualBudgetId: DateTime.now().millisecondsSinceEpoch,
    annualBudgetName: 'Annual Budget Name 4',
    annualProductionId: DateTime.now().millisecondsSinceEpoch,
    farmId: DateTime.now().millisecondsSinceEpoch,
    balanceAmount: 1000,
    expenseAmount: 101.11,
    incomeAmount: 3033.22,
  ),
];

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

class _AnnualBudgetManagementScreenState extends State<AnnualBudgetManagementScreen> {
  Timer? _debounceInputTimer;
  late List<AnnualProductionBudget> filteredItems;

  @override
  void initState() {
    super.initState();
    filteredItems = _mockData;
  }

  void searching(String? input) {
    if (input == null || input.isEmpty) {
      filteredItems = _mockData;
    } else {
      filteredItems = _mockData
          .where((element) => element.annualBudgetName?.toString().toLowerCase().contains(input.toLowerCase()) ?? false)
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.annualBudgets.tr(),
        subtitle: 'Imbeza',
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
                _debounceInputTimer = Timer(const Duration(milliseconds: 200), () => searching(input));
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                return _buildItemCard(filteredItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(AnnualProductionBudget model) {
    return CmoTappable(
      onTap: () {},
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
            value: model.balanceAmount?.toStringAsFixed(2) ?? '000',
          ),
          CmoCardItem(
            title: LocaleKeys.income.tr(),
            value: model.incomeAmount?.toStringAsFixed(2) ?? '000',
          ),
          CmoCardItem(
            title: LocaleKeys.expenses.tr(),
            value: model.expenseAmount?.toStringAsFixed(2) ?? '000',
          ),
        ],
      ),
    );
  }
}
