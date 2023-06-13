import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_production_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/annual_budget_management_screen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/management_plan/management_plan_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class SiteManagementPlanScreen extends StatelessWidget {
  const SiteManagementPlanScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const SiteManagementPlanScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.siteManagementPlan.tr(),
        subtitle: LocaleKeys.imbeza.tr(),
        showLeading: true,
      ),
      body: SizedBox.expand(
        child: Column(
          children: _buildCharcoalManagementPlan(context),
        ),
      ),
    );
  }

  List<Widget> _buildPlantationFMP(BuildContext context) {
    return [
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
    ];
  }

  List<Widget> _buildCharcoalManagementPlan(BuildContext context) {
    return [
      _compartmentCard(),
      CmoTappable(
        onTap: () {},
        child: CmoCard(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          content: [
            CmoCardHeader(title: LocaleKeys.annual_production.tr()),
            CmoCardItem(title: LocaleKeys.production.tr(), value: '2'),
            CmoCardItem(title: LocaleKeys.forecast.tr()),
          ],
        ),
      ),
      CmoTappable(
        onTap: () {},
        child: CmoCard(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          content: [
            CmoCardHeader(title: LocaleKeys.annual_budget.tr()),
            CmoCardHeader(title: LocaleKeys.budget.tr(), value: '1'),
          ],
        ),
      ),
    ];
  }

  Widget _compartmentCard() {
    return CmoTappable(
      onTap: () {},
      child: CmoCard(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        content: [
          CmoCardHeader(title: LocaleKeys.compartment_management.tr()),
          CmoCardItem(title: '${LocaleKeys.camp.tr()}\s', value: '1'),
          CmoCardItem(title: LocaleKeys.summary_tonnes_biomass.tr(args: ['7'])),
        ],
      ),
    );
  }
}
