import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/management_plan/widgets/expandable_management_plan_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class ManagementPlanScreen extends StatefulWidget {

  const ManagementPlanScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ManagementPlanScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ManagementPlanScreen(),
      ),
    );
  }
}

class _ManagementPlanScreenState extends State<ManagementPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.managementPlan.tr(),
        subtitle: 'Imbeza',
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),

      body: ListView.separated(
          itemCount: 3,
          itemBuilder: (context, index) {
        return ExpandableManagementPlanItem();
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24,),
      )
    );
  }
}
