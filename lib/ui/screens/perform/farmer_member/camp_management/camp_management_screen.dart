import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/farmer/camp_management/camp_management_cubit.dart';
import 'package:cmo/state/farmer/camp_management/camp_management_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CampManagementScreen extends BaseStatefulWidget {
  CampManagementScreen({Key? key})
      : super(
          key: key,
          screenName: LocaleKeys.site.tr(),
        );

  static Future push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return BlocProvider(
          create: (_) => CampManagementCubit()..init(),
          child: CampManagementScreen(),
        );
      }),
    );
  }

  @override
  State<CampManagementScreen> createState() => _CampManagementScreenState();
}

class _CampManagementScreenState extends BaseStatefulWidgetState<CampManagementScreen> {
  Timer? _debounceInputTimer;
  List<Camp> _filteredCamps = [];
  late CampManagementCubit cubit;
  String? filteringText;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CampManagementCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CampManagementCubit, CampManagementState, Farm?>(
      selector: (state) => state.farm,
      builder: (context, farm) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.site.tr(),
            subtitle: farm?.farmName ?? '',
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: () async {
              await AddCampScreen.push(context);
              cubit.init();
            },
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
                        const Duration(milliseconds: 200), () {
                      filteringText = input;
                          filter(isCallingSetState: true);
                        });
                  },
                ),
              ),
              Expanded(
                child: BlocSelector<CampManagementCubit, CampManagementState,
                    List<Camp>?>(
                  selector: (state) => state.camps,
                  builder: (context, camps) {
                    filter();
                    final total = _filteredCamps.fold(0.0, (previousValue, element) => previousValue + (element.totalBiomass ?? 0.0));
                    return Column(
                      children: [
                        CmoHeaderTile(
                          title:
                              LocaleKeys.summary_tonnes_biomass.tr(args: [total.toStringAsFixed(2)]),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                vertical: 22, horizontal: 22),
                            itemCount: _filteredCamps.length,
                            separatorBuilder: (_, index) =>
                                const SizedBox(height: 22),
                            itemBuilder: (_, index) {
                              final camp = _filteredCamps[index];
                              return Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  border: Border.all(color: context.colors.blue),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    await AddCampScreen.push(context, camp: camp);
                                    cubit.init();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(4, 4, 4, 10),
                                          child: Text(
                                            '${LocaleKeys.campName.tr()}: ${camp.campName}',
                                            style: context.textStyles.bodyBold
                                                .copyWith(color: context.colors.blue),
                                          ),
                                        ),
                                        _CampAttributeWidget(
                                          color: context.colors.greyLight1,
                                          name: LocaleKeys
                                              .infestation_weighted_average
                                              .tr(),
                                          value:
                                              '${camp.infestedWieghtedAverage != null ? camp.infestedWieghtedAverage?.toStringAsFixed(0) : ''}%',
                                        ),
                                        _CampAttributeWidget(
                                          name: LocaleKeys.estimated_biomass.tr(),
                                          value:
                                              '${camp.estimatedBiomass != null ? camp.estimatedBiomass?.toStringAsFixed(2) : ''}',
                                        ),
                                        _CampAttributeWidget(
                                          color: context.colors.greyLight1,
                                          name: LocaleKeys.total_biomass.tr(),
                                          value:
                                              '${camp.totalBiomass != null ? camp.totalBiomass?.toStringAsFixed(2) : ''}',
                                        ),
                                        _CampAttributeWidget(
                                          name: LocaleKeys.cumulative_biomass.tr(),
                                          value:
                                              '${camp.cumulativeBiomass != null ? camp.cumulativeBiomass?.toStringAsFixed(2) : ''}',
                                        ),
                                        _CampAttributeWidget(
                                          color: context.colors.greyLight1,
                                          name:
                                              LocaleKeys.planned_year_of_harvest.tr(),
                                          value:
                                              '${camp.plannedYearOfHarvest != null ? camp.plannedYearOfHarvest?.toString() : ''}',
                                        ),
                                        _CampAttributeWidget(
                                          name:
                                              LocaleKeys.actual_year_of_harvest.tr(),
                                          value:
                                              '${camp.actualYearOfHarvest != null ? camp.actualYearOfHarvest?.toString() : ''}',
                                        ),
                                        _CampAttributeWidget(
                                          color: context.colors.greyLight1,
                                          name: LocaleKeys.tons_of_product_produced
                                              .tr(),
                                          value:
                                              '${camp.tonsOfCharcoalProduced != null ? camp.tonsOfCharcoalProduced?.toStringAsFixed(2) : ''}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void filter({bool isCallingSetState = false}) {
    final camps = cubit.state.camps ?? [];
    if (filteringText == null || filteringText!.isEmpty) {
      _filteredCamps = camps;
    } else {
      _filteredCamps = camps
          .where((element) =>
              element.campName?.toLowerCase().contains(filteringText!.toLowerCase()) ??
              false)
          .toList();
    }
    if (isCallingSetState) {
      setState(() {});
    }
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
