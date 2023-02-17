import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_card.dart';
import 'package:flutter/material.dart';

import 'dashboard_drawer.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key, required this.entity});

  final String entity;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CmoAppBar(
        title: LocaleKeys.dashboard.tr(),
        subtitle: entity,
        leading: Assets.icons.icDrawer.svg(),
        onTapLeading: () => scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: DashboardDrawer(
        onTapClose: () => scaffoldKey.currentState?.closeDrawer(),
      ),
      drawerScrimColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            CmoCard(
              content: [
                CmoCardHeader(title: 'Member/s'),
                CmoCardItem(title: 'Onboarded', value: '5/10'),
                CmoCardItem(title: 'Incomplete', value: '8/10'),
              ],
            ),
            SizedBox(height: 20),
            CmoCard(
              content: [
                CmoCardHeader(title: 'Sync'),
                CmoCardItem(title: 'Synced', value: '5'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
