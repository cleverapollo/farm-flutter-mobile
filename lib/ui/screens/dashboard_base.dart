import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/screens/behave/dashboard/dashboard_screen.dart';
import 'package:cmo/ui/screens/behave/menu/behave_menu_drawer.dart';
import 'package:cmo/ui/screens/perform/farmer_member/dashboard/farmer_member_dashboard_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/dashboard/resource_manager_dashboard_screen.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_mode_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => DashboardScreen(),
      ),
    );
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final entityName = context
        .select<EntityCubit, String?>((cubit) => cubit.state.entity?.name);

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
        drawer: BehaveMenu(
          onTapClose: () => scaffoldKey.currentState?.closeDrawer(),
        ),
        drawerScrimColor: Colors.transparent,
        body: CmoModeBuilder(
          behaveBuilder: (_) => const BehaveDashboardScreen(),
          resourceManagerBuilder: (_) => const ResourceManagerDashboardScreen(),
          farmerBuilder: (_) => const FarmerMemberDashboardScreen(),
        ),
      ),
    );
  }
}
