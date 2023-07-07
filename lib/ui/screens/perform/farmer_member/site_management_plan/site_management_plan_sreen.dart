import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_production_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/annual_budget_management_screen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/management_plan/management_plan_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiteManagementPlanScreen extends StatefulWidget {
  const SiteManagementPlanScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SiteManagementPlanScreen(),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _SiteManagementPlanScreenState();
}

class _SiteManagementPlanScreenState extends State<SiteManagementPlanScreen> {

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
      appBar: CmoAppBarV2(
        title: LocaleKeys.siteManagementPlan.tr(),
        subtitle: context
            .watch<SiteManagementPlanCubit>()
            .state
            .activeFarm
            ?.farmName ?? '',
        showLeading: true,
      ),
      body: SizedBox.expand(
        child: _buildContentWidget(),
      ),
    );
  }

  Widget _buildContentWidget() {
    return _buildCharcoalManagementPlan();
  }

  Widget _buildPlantationFMP() {
    return Column(
      children: [
        _compartmentCard(),
        CmoTappable(
          onTap: () => ManagementPlanScreen.push(context),
          child: CmoCard(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            content: [
              CmoCardHeader(title: LocaleKeys.managementPlan.tr()),
            ],
          ),
        ),
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
            _compartmentCard(),
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

  Widget _compartmentCard() {
    return CmoTappable(
      onTap: () {},
      child: CmoCard(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        content: [
          CmoCardHeader(title: LocaleKeys.compartment_management.tr()),
          CmoCardItem(title: '${LocaleKeys.camp.tr()}\s', value: '1'),
          CmoCardItem(title: LocaleKeys.summary_tonnes_biomass.tr(args: ['7'])),
        ],
      ),
    );
  }
}
