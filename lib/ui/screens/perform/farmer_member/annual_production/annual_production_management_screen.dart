import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/annual_production/annual_production.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/add_new_annual/add_new_annual_production_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/widgets/annual_production_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<AnnualProduction> _mockData = [
  AnnualProduction(
    biomassRemoved: 3,
    productionPerTeam: 4,
    productionPerWorker: 3,
    workCycles: 2,
    workers: 12,
    year: 2022,
  ),
  AnnualProduction(
    biomassRemoved: 3,
    productionPerTeam: 4,
    productionPerWorker: 3,
    workCycles: 2,
    workers: 12,
    year: 2023,
  ),
  AnnualProduction(
    biomassRemoved: 3,
    productionPerTeam: 4,
    productionPerWorker: 3,
    workCycles: 2,
    workers: 12,
    year: 2024,
  ),
];

class AnnualProductionManagementScreen extends StatefulWidget {
  const AnnualProductionManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AnnualProductionManagementScreen();

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AnnualProductionManagementScreen(),
      ),
    );
  }
}

class _AnnualProductionManagementScreen extends State<AnnualProductionManagementScreen> {
  Timer? _debounceInputTimer;
  late List<AnnualProduction> filteredItems;

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
          .where((element) => element.year?.toString().toLowerCase().contains(input.toLowerCase()) ?? false)
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.annualProduction.tr(),
        subtitle: 'Imbeza',
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddNewAnnualProductionScreen.push(context),
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
                return AnnualProductionItemWidget(
                  annualProduction: filteredItems[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
