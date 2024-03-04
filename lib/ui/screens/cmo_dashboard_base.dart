import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/behave/dashboard/behave_dashboard_screen.dart';
import 'package:cmo/ui/screens/cmo_menu_base.dart';
import 'package:cmo/ui/screens/perform/farmer_member/dashboard/farmer_member_dashboard_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/dashboard/resource_manager_dashboard_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class CmoDashboardBase extends BaseStatefulWidget {
  CmoDashboardBase({super.key}) : super(screenName: '') {
    navigationBreadcrumbs.initNavigationBreadcrumbs();
  }

  static void push(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => CmoDashboardBase()),
    );
  }

  @override
  State<CmoDashboardBase> createState() => _CmoDashboardBaseState();
}

class _CmoDashboardBaseState extends BaseStatefulWidgetState<CmoDashboardBase> {
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
  bool get canPopWithoutWarningDialog => false;

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
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
        haveNoDataBuilder: (_) => const SizedBox.shrink(),
      ),
      drawerScrimColor: Colors.transparent,
      body: CmoModeBuilder(
        behaveBuilder: (_) => const BehaveDashboardScreen(),
        resourceManagerBuilder: (_) =>
        const ResourceManagerDashboardScreen(),
        farmerBuilder: (_) => const FarmerMemberDashboardScreen(),
        haveNoDataBuilder: (_) => const HaveNoDataDashboard(),
      ),
    );
  }
}

class HaveNoDataDashboard extends StatelessWidget {
  const HaveNoDataDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            LocaleKeys.you_have_no_data.tr(),
            textAlign: TextAlign.center,
            style: context.textStyles.bodyNormal.blueDark2,
          ),
        ),
        const SizedBox(height: 12),
        const LogoutButton(),
      ],
    );
  }
}