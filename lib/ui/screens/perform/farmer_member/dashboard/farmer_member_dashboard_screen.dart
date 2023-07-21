import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/register_management.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/site_management_plan_sreen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/farmer_sync_summary_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/sync_summary/resource_manager_sync_summary_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerMemberDashboardScreen extends StatelessWidget {
  const FarmerMemberDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardCubit, DashboardState, DashboardState>(
      selector: (state) => state,
      builder: (context, state) {
        return ListView(
          clipBehavior: Clip.none,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            CmoCard(
              onTap: () {
                SiteManagementPlanScreen.push(context);
              },
              content: [
                CmoCardHeader(title: LocaleKeys.siteManagementPlan.tr()),
              ],
            ),
            const SizedBox(height: 20),
            CmoCard(
              onTap: () => RegisterManagement.push(context),
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
            CmoTappable(
              onTap: () {
                LabourManagementScreen.push(context);
              },
              child: CmoCard(
                content: [
                  CmoCardHeader(title: LocaleKeys.labourManagement.tr()),
                  CmoCardItem(
                    title: LocaleKeys.workers.tr(),
                    value: state.totalWorkers.toString(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CmoTappable(
              onTap: () {
                FarmerSyncSummaryScreen.push(context);
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
      },
    );
  }
}
