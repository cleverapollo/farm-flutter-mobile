import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/screens/perform/action_log/management/action_log_management.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/register_management.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/site_management_plan_sreen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/farmer_sync_summary_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/dashboard/resource_manager_dashboard_screen.dart';
import 'package:cmo/ui/screens/perform/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerMemberDashboardScreen extends StatefulWidget {
  const FarmerMemberDashboardScreen({super.key});

  @override
  State<FarmerMemberDashboardScreen> createState() =>
      _FarmerMemberDashboardScreenState();
}

class _FarmerMemberDashboardScreenState
    extends State<FarmerMemberDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<DashboardCubit>().initializeFarmDashBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, data) {
        return ListView(
          clipBehavior: Clip.none,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            DashboardItemWidget(
              title: LocaleKeys.siteManagementPlan.tr(),
              icon: Assets.icons.icDashboardSync.svg(),
              onTap: () => SiteManagementPlanScreen.push(context),
              listInformationWidget: [
                CmoCardHeader(title: LocaleKeys.siteManagementPlan.tr()),
              ],
            ),
            const SizedBox(height: 20),
            DashboardItemWidget(
              title: LocaleKeys.labourManagement.tr(),
              icon: Assets.icons.icDashboardSync.svg(),
              onTap: () => LabourManagementScreen.push(context),
              listInformationWidget: [
                CmoCardHeader(title: LocaleKeys.labourManagement.tr()),
                BlocSelector<DashboardCubit, DashboardState, bool>(
                  selector: (state) => state.loading,
                  builder: (context, isLoading) {
                    return CmoCardItem(
                      isLoading: isLoading,
                      title: LocaleKeys.workers.tr(),
                      value: '${data.farmDashBoardInfo?.totalLabour ?? ''}',
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocSelector<DashboardCubit, DashboardState, bool?>(
              selector: (state) => state.loading,
              builder: (context, dashboardInfo) {
                return DashboardItemWidget(
                  title: LocaleKeys.neighbours.tr(),
                  icon: Assets.icons.icDashboardSync.svg(),
                  onTap: () => StakeHolderManagementScreen.push(context),
                  listInformationWidget: [
                    CmoCardHeader(title: LocaleKeys.neighbours.tr()),
                    CmoCardItem(
                      title: LocaleKeys.local_neighbours.tr(),
                      value: '${data.farmDashBoardInfo?.totalStakeholder}',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            DashboardItemWidget(
              title: LocaleKeys.monitoring.tr(),
              icon: Assets.icons.icDashboardSync.svg(),
              onTap: () => RegisterManagement.push(context),
              listInformationWidget: [
                CmoCardHeader(title: LocaleKeys.monitoring.tr()),
                const SizedBox(height: 16,),
              ],
            ),
            const SizedBox(height: 20),
            DashboardItemWidget(
              title: LocaleKeys.action_log.tr(),
              icon: Assets.icons.icDashboardSync.svg(),
              onTap: () => ActionLogManagement.push(context),
              listInformationWidget: [
                const SizedBox(height: 16,),
                CmoCardHeader(title: LocaleKeys.action_log.tr()),
                const SizedBox(height: 16,),
              ],
            ),
            const SizedBox(height: 20),
            DashboardItemWidget(
              title: LocaleKeys.sync.tr(),
              icon: Assets.icons.icDashboardSync.svg(),
              onTap: () => FarmerSyncSummaryScreen.push(context),
              listInformationWidget: [
                const SizedBox(height: 16,),
                CmoCardHeader(title: '${LocaleKeys.sync.tr()}(${LocaleKeys.upload.tr()})'),
                const SizedBox(height: 16,),
              ],
            ),
          ],
        );
      },
    );
  }
}
