import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_card.dart';
import 'package:flutter/material.dart';

import 'dashboard_drawer.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key, required this.entity});

  static void push(BuildContext context, {required Entity entity}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => DashboardScreen(entity: entity),
      ),
    );
  }

  final Entity entity;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CmoAppBar(
        title: LocaleKeys.dashboard.tr(),
        subtitle: entity.name,
        leading: Assets.icons.icDrawer.svg(),
        onTapLeading: () => scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: DashboardDrawer(
        onTapClose: () => scaffoldKey.currentState?.closeDrawer(),
      ),
      drawerScrimColor: Colors.transparent,
      body: ListView(
        clipBehavior: Clip.none,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.member_s.tr()),
              CmoCardItem(title: LocaleKeys.onboarded.tr(), value: '5/10'),
              CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
            ],
          ),
          const SizedBox(height: 20),
          CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.audit_s.tr()),
              CmoCardItem(title: LocaleKeys.onboarded.tr(), value: '5/10'),
              CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
              CmoCardItemHighlighted(
                  title: LocaleKeys.membersOutstanding.tr(), value: '8/10'),
            ],
          ),
          const SizedBox(height: 20),
          CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.stakeholders.tr()),
              CmoCardItem(title: LocaleKeys.national.tr(), value: '50'),
            ],
          ),
          const SizedBox(height: 20),
          CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.cars.tr()),
              CmoCardItem(title: LocaleKeys.opened.tr(), value: '5'),
              CmoCardItem(title: LocaleKeys.overdue.tr(), value: '5'),
            ],
          ),
          const SizedBox(height: 20),
          CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.sync.tr()),
              CmoCardItem(title: LocaleKeys.synced.tr(), value: '5'),
            ],
          ),
        ],
      ),
    );
  }
}
