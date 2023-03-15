import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/screen/assessments/assessments_screen.dart';
import 'package:cmo/ui/screen/create_worker/create_worker_screen.dart';
import 'package:cmo/ui/screen/dashboard/dashboard_drawer.dart';
import 'package:cmo/ui/screen/sync_summary/sync_summary_screen.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_card.dart';
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
        drawer: DashboardDrawer(
          onTapClose: () => scaffoldKey.currentState?.closeDrawer(),
        ),
        drawerScrimColor: Colors.transparent,
        body: CmoModeBuilder(
          behaveBuilder: (_) => const _Behave(),
          resourceManagerBuilder: (_) => const _ResourceManager(),
          farmerBuilder: (_) => const _Farmer(),
        ),
      ),
    );
  }
}

class _Behave extends StatelessWidget {
  const _Behave();

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        CmoTappable(
          onTap: () => AssessmentsScreen.push(context),
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.assessments.tr()),
              CmoCardItem(title: LocaleKeys.onboarded.tr(), value: '2/10'),
              CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () => CreateWorkerScreen.push(context),
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.createWorker.tr()),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () => SyncSummaryScreen.push(context),
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.sync.tr()),
              CmoCardItem(title: LocaleKeys.synced.tr(), value: '5'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ResourceManager extends StatelessWidget {
  const _ResourceManager();

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              title: LocaleKeys.membersOutstanding.tr(),
              value: '8/10',
            ),
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
        CmoTappable(
          onTap: () {
            SyncSummaryScreen.push(context);
          },
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.sync.tr()),
              CmoCardItem(title: LocaleKeys.synced.tr(), value: '5'),
            ],
          ),
        ),
      ],
    );
  }
}

class _Farmer extends StatelessWidget {
  const _Farmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        CmoCard(
          content: [
            CmoCardHeader(title: LocaleKeys.siteManagementPlan.tr()),
          ],
        ),
        const SizedBox(height: 20),
        CmoCard(
          content: [
            CmoCardHeader(title: LocaleKeys.registerCaseManagement.tr()),
          ],
        ),
        const SizedBox(height: 20),
        CmoCard(
          content: [
            CmoCardHeader(title: LocaleKeys.cars.tr()),
            CmoCardItem(title: LocaleKeys.opened.tr(), value: '1'),
            CmoCardItem(title: LocaleKeys.closed.tr(), value: '1'),
          ],
        ),
        const SizedBox(height: 20),
        CmoCard(
          content: [
            CmoCardHeader(title: LocaleKeys.labourManagement.tr()),
            CmoCardItem(title: LocaleKeys.workers.tr(), value: '10'),
          ],
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () {
            SyncSummaryScreen.push(context);
          },
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.sync.tr()),
              CmoCardItem(title: LocaleKeys.newItems.tr(), value: ''),
            ],
          ),
        ),
      ],
    );
  }
}
