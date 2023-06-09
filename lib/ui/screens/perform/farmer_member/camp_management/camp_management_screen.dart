import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class CampManagementScreen extends StatefulWidget {
  CampManagementScreen({Key? key}) : super(key: key);

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CampManagementScreen()),
    );
  }

  static final List<Camp> _mockData = [
    Camp()
      ..campName = 'Magic Forest'
      ..infestedWieghtedAverage = 2
      ..estimatedBiomass = 10
      ..totalBiomass = 57
      ..cumulativeBiomass = 80
      ..plannedYearOfHarvest = 2023
      ..actualYearOfHarvest = 2024
      ..tonsOfCharcoalProduced = 100,
    Camp()
      ..campName = 'Magic Forest'
      ..infestedWieghtedAverage = 2
      ..estimatedBiomass = 10
      ..totalBiomass = 57
      ..cumulativeBiomass = 80
      ..plannedYearOfHarvest = 2023
      ..actualYearOfHarvest = 2024
      ..tonsOfCharcoalProduced = 100,
    Camp()
      ..campName = 'Magic Forest'
      ..infestedWieghtedAverage = 2
      ..estimatedBiomass = 10
      ..totalBiomass = 57
      ..cumulativeBiomass = 80
      ..plannedYearOfHarvest = 2023
      ..actualYearOfHarvest = 2024
      ..tonsOfCharcoalProduced = 100,
  ];

  @override
  State<CampManagementScreen> createState() => _CampManagementScreenState();
}

class _CampManagementScreenState extends State<CampManagementScreen> {
  Timer? _debounceInputTimer;
  List<Camp> _filteredCamps = [];

  @override
  void initState() {
    super.initState();
    _filteredCamps = CampManagementScreen._mockData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.site.tr(),
        subtitle: LocaleKeys.imbeza.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddCampScreen.push(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 12,
              right: 24,
              bottom: 24,
            ),
            child: CmoTextField(
              name: 'search_item',
              prefixIcon: Assets.icons.icSearch.svg(),
              hintText: LocaleKeys.search.tr(),
              onChanged: (input) {
                _debounceInputTimer?.cancel();
                _debounceInputTimer = Timer(
                    const Duration(milliseconds: 200), () => filter(input));
              },
            ),
          ),
          CmoHeaderTile(
            title: LocaleKeys.summary_tonnes_biomass.tr(args: ['100']),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
              itemCount: _filteredCamps.length,
              separatorBuilder: (_, index) => const SizedBox(height: 22),
              itemBuilder: (_, index) {
                final camp = _filteredCamps[index];
                return Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 10),
                          child: Text(
                            '${LocaleKeys.campName.tr()}: ${camp.campName}',
                            style: context.textStyles.bodyBold
                                .copyWith(color: context.colors.blue),
                          ),
                        ),
                        _CampAttributeWidget(
                          color: context.colors.greyLight1,
                          name: LocaleKeys.infestation_weighted_average.tr(),
                          value:
                              '${camp.infestedWieghtedAverage?.toStringAsFixed(0)}%',
                        ),
                        _CampAttributeWidget(
                          name: LocaleKeys.estimated_biomass.tr(),
                          value: '${camp.estimatedBiomass?.toStringAsFixed(0)}',
                        ),
                        _CampAttributeWidget(
                          color: context.colors.greyLight1,
                          name: LocaleKeys.total_biomass.tr(),
                          value: '${camp.totalBiomass?.toStringAsFixed(0)}',
                        ),
                        _CampAttributeWidget(
                          name: LocaleKeys.cumulative_biomass.tr(),
                          value:
                              '${camp.cumulativeBiomass?.toStringAsFixed(2)}',
                        ),
                        _CampAttributeWidget(
                          color: context.colors.greyLight1,
                          name: LocaleKeys.planned_year_of_harvest.tr(),
                          value: '${camp.plannedYearOfHarvest?.toString()}',
                        ),
                        _CampAttributeWidget(
                          name: LocaleKeys.actual_year_of_harvest.tr(),
                          value: '${camp.actualYearOfHarvest?.toString()}',
                        ),
                        _CampAttributeWidget(
                          color: context.colors.greyLight1,
                          name: LocaleKeys.tons_of_charcoal_produced.tr(),
                          value:
                              '${camp.tonsOfCharcoalProduced?.toStringAsFixed(0)}',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void filter(String? input) {
    if (input == null || input.isEmpty) {
      _filteredCamps = CampManagementScreen._mockData;
    } else {
      _filteredCamps = CampManagementScreen._mockData
          .where((element) =>
              element.campName?.toLowerCase().contains(input.toLowerCase()) ??
              false)
          .toList();
    }
    setState(() {});
  }
}

class _CampAttributeWidget extends StatelessWidget {
  final Color? color;
  final String name;
  final String? value;
  final TextAlign valueTextAlign;

  const _CampAttributeWidget({
    Key? key,
    this.color,
    required this.name,
    this.value,
    this.valueTextAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Text(name, style: context.textStyles.bodyNormal),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              value ?? '',
              style: context.textStyles.bodyNormal,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
