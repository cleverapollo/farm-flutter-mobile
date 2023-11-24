import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/annual_budget_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_production_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/camp_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class SiteManagementPlanScreen extends BaseStatefulWidget {
  SiteManagementPlanScreen({super.key}) : super(screenName: LocaleKeys.siteManagementPlan.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SiteManagementPlanScreen(),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _SiteManagementPlanScreenState();
}

class _SiteManagementPlanScreenState extends BaseStatefulWidgetState<SiteManagementPlanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<SiteManagementPlanCubit>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.siteManagementPlan.tr(),
        subtitle: context
                .watch<SiteManagementPlanCubit>()
                .state
                .activeFarm
                ?.farmName ??
            '',
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocSelector<SiteManagementPlanCubit, SiteManagementPlanState, bool>(
        selector: (state) => state.loading,
        builder: (context, isLoading) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox.expand(
              child: BlocSelector<SiteManagementPlanCubit,
                  SiteManagementPlanState, CharcoalPlantationRoleEnum>(
                selector: (state) => state.charcoalPlantationRoleEnum,
                builder: (context, charcoalPlantationRoleEnum) {
                  switch (charcoalPlantationRoleEnum) {
                    case CharcoalPlantationRoleEnum.isCharcoal:
                      return _buildCharcoalManagementPlan();
                    case CharcoalPlantationRoleEnum.isPlantation:
                      return _buildPlantationFMP();
                    case CharcoalPlantationRoleEnum.none:
                      return Container();
                  }
                },
              ),
            );
        },
      ),
          ),
    );
  }

  Widget _buildPlantationFMP() {
    return Column(
      children: [
        const SizedBox(height: 16,),
        _compartmentCard(context),
      ],
    );
  }

  Widget _buildCharcoalManagementPlan() {
    return BlocSelector<SiteManagementPlanCubit, SiteManagementPlanState,
        SiteManagementPlanState>(
      selector: (state) => state,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 16,),
            _campCard(context),
            CmoTappable(
              onTap: () {
                AnnualProductionManagementScreen.push(context);
              },
              child: CmoCard(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                content: [
                  CmoCardHeader(title: LocaleKeys.annual_production.tr()),
                  CmoCardItem(
                    title: LocaleKeys.production.tr(),
                    value: state.totalAnnualFarmProductions.toString(),
                  ),
                  CmoCardItem(title: LocaleKeys.forecast.tr()),
                ],
              ),
            ),
            CmoTappable(
              onTap: () {
                AnnualBudgetManagementScreen.push(context);
              },
              child: CmoCard(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                content: [
                  CmoCardHeader(title: LocaleKeys.annual_budget.tr()),
                  CmoCardItem(
                    title: LocaleKeys.budget.tr(),
                    value: state.totalAnnualBudgets.toString(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _campCard(BuildContext context) {
    return CmoTappable(
      onTap: () {
        CampManagementScreen.push(context);
      },
      child: BlocSelector<SiteManagementPlanCubit, SiteManagementPlanState,
          Tuple2<int, double>>(
        selector: (state) =>
            Tuple2(state.campCount ?? 0, state.campTonnesOfBiomass ?? 0),
        builder: (context, tuple2) {
          return CmoCard(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            content: [
              CmoCardHeader(title: LocaleKeys.campManagement.tr()),
              CmoCardItem(
                  title: '${LocaleKeys.camp.tr()}\s',
                  value: tuple2.item1.toString()),
              CmoCardItem(
                  title: LocaleKeys.summary_tonnes_biomass
                      .tr(args: [tuple2.item2.toStringAsFixed(2)])),
            ],
          );
        },
      ),
    );
  }

  Widget _compartmentCard(BuildContext context) {
    return CmoTappable(
      onTap: () async {
        final state = context.read<SiteManagementPlanCubit>().state;
        await CompartmentScreen.push(
          context,
          farmId: state.activeFarm?.farmId,
          farmName: state.activeFarm?.farmName,
        );
        context.read<SiteManagementPlanCubit>().refresh();
      },
      child: BlocSelector<SiteManagementPlanCubit, SiteManagementPlanState,
          Tuple2<int, double>>(
        selector: (state) => Tuple2(
            state.compartmentCount ?? 0, state.compartmentTotalArea ?? 0),
        builder: (context, tuple2) {
          return CmoCard(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            content: [
              CmoCardHeader(title: LocaleKeys.compartment_management.tr()),
              CmoCardItem(
                  title: '${LocaleKeys.compartments.tr()}',
                  value: tuple2.item1.toString()),
              CmoCardItem(
                  title: '${LocaleKeys.total.tr()}',
                  value: tuple2.item2.toStringAsFixed(2)),
            ],
          );
        },
      ),
    );
  }
}
