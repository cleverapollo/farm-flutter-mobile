import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/sync_summary/resource_manager_sync_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceManagerDashboardScreen extends StatefulWidget {
  const ResourceManagerDashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ResourceManagerDashboardScreenState();
}

class _ResourceManagerDashboardScreenState
    extends State<ResourceManagerDashboardScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<DashboardCubit>().initializeRM();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardCubit, DashboardState, DashboardState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.colors.white,
            ),
          );
        }

        if (state.error != null && kDebugMode) {
          return Center(
            child: Text(
              '${state.error}',
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () {
            return context.read<DashboardCubit>().initializeRM();
          },
          child: ListView(
            clipBehavior: Clip.none,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            children: [
              CmoTappable(
                onTap: () {
                  context.read<DashboardCubit>().getResourceManagerMembers();
                },
                child: BlocSelector<DashboardCubit, DashboardState,
                    RMDashboardInfo?>(
                  selector: (state) => state.rmDashboardInfo,
                  builder: (context, dashboardInfo) {
                    return CmoCard(
                      content: [
                        CmoCardHeader(title: LocaleKeys.member_s.tr()),
                        CmoCardItem(
                            title: LocaleKeys.onboarded.tr(),
                            value:
                                '${dashboardInfo?.onboardedMembers}/${dashboardInfo?.totalMembers}'),
                        CmoCardItem(
                            title: LocaleKeys.incomplete.tr(),
                            value:
                                '${dashboardInfo?.incompletedMembers}/${dashboardInfo?.totalMembers}'),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CmoTappable(
                onTap: () {
                  AuditManagementScreen.push(context);
                },
                child: CmoCard(
                  content: [
                    CmoCardHeader(title: LocaleKeys.audit_s.tr()),
                    CmoCardItem(
                        title: LocaleKeys.onboarded.tr(), value: '5/10'),
                    CmoCardItem(
                        title: LocaleKeys.incomplete.tr(), value: '8/10'),
                    CmoCardItemHighlighted(
                      title: LocaleKeys.membersOutstanding.tr(),
                      value: '8/10',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CmoTappable(
                onTap: () {
                  //StakeHolderManagementScreen.push(context);
                  context.read<DashboardCubit>().initializeRM();
                },
                child: BlocSelector<DashboardCubit, DashboardState,
                    RMDashboardInfo?>(
                  selector: (state) => state.rmDashboardInfo,
                  builder: (context, dashboardInfo) {
                    return CmoCard(
                      content: [
                        CmoCardHeader(title: LocaleKeys.stakeholders.tr()),
                        CmoCardItem(
                          title: LocaleKeys.national.tr(),
                          value: '${dashboardInfo?.stakeHolders ?? 0}',
                        ),
                      ],
                    );
                  },
                ),
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
                  ResourceManagerSyncSummaryScreen.push(context);
                },
                child: CmoCard(
                  content: [
                    CmoCardHeader(title: LocaleKeys.sync.tr()),
                    CmoCardItem(title: LocaleKeys.synced.tr(), value: '5'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
