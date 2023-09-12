import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/behave/dashboard/behave_dashboard_screen.dart';
import 'package:cmo/ui/screens/cmo_menu_base.dart';
import 'package:cmo/ui/screens/perform/farmer_member/dashboard/farmer_member_dashboard_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/dashboard/resource_manager_dashboard_screen.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_mode_builder.dart';
import 'package:flutter/material.dart';

class CmoDashboardBase extends StatefulWidget {
  const CmoDashboardBase({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const CmoDashboardBase()),
    );
  }

  @override
  State<CmoDashboardBase> createState() => _CmoDashboardBaseState();
}

class _CmoDashboardBaseState extends State<CmoDashboardBase> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String? entityName;
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final userRole = await configService.getActiveUserRole();
      if (userRole == null) return;
      switch (userRole) {
        case UserRoleEnum.behave:
          final company = await configService.getActiveCompany();
          entityName = company?.companyName;
          break;
        case UserRoleEnum.regionalManager:
          final resourceManager = await configService.getActiveRegionalManager();
          entityName = resourceManager?.regionalManagerUnitName;
          break;
        case UserRoleEnum.farmerMember:
          final farm = await configService.getActiveFarm();
          entityName = farm?.farmName;
          break;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          key: scaffoldKey,
          appBar: CmoAppBar(
            title: LocaleKeys.dashboard.tr(),
            subtitle: entityName,
            leading: Assets.icons.icDrawer.svg(),
            onTapLeading: () => scaffoldKey.currentState?.openDrawer(),
          ),
          drawer: CmoModeBuilder(
            behaveBuilder: (_) => CmoMenuBase.behave(
              onTapClose: () => scaffoldKey.currentState?.closeDrawer(),
            ),
            resourceManagerBuilder: (_) => CmoMenuBase.resourceManager(
              onTapClose: () {
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            farmerBuilder: (_) => CmoMenuBase.farmerMember(
              onTapClose: () => scaffoldKey.currentState?.closeDrawer(),
            ),
          ),
          drawerScrimColor: Colors.transparent,
          body: CmoModeBuilder(
            behaveBuilder: (_) => const BehaveDashboardScreen(),
            resourceManagerBuilder: (_) =>
                const ResourceManagerDashboardScreen(),
            farmerBuilder: (_) => const FarmerMemberDashboardScreen(),
          )),
    );
  }
}
