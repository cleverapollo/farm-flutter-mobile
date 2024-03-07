import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/register_management.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/site_management_plan_sreen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/farmer_sync_summary_screen.dart';
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
            CmoCard(
              onTap: () {
                SiteManagementPlanScreen.push(context);
              },
              content: [
                CmoCardHeader(title: LocaleKeys.siteManagementPlan.tr()),
              ],
            ),
            const SizedBox(height: 20),
            CmoTappable(
              onTap: () => LabourManagementScreen.push(context),
              child: CmoCard(
                content: [
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
            ),
            const SizedBox(height: 20),
            CmoCard(
              onTap: () => RegisterManagement.push(context),
              content: [
                CmoCardHeader(title: LocaleKeys.monitoring.tr()),
              ],
            ),
            const SizedBox(height: 20),
            CmoTappable(
              onTap: () => StakeHolderManagementScreen.push(context),
              child: BlocSelector<DashboardCubit, DashboardState, bool?>(
                selector: (state) => state.loading,
                builder: (context, dashboardInfo) {
                  return CmoCard(
                    content: [
                      CmoCardHeader(title: LocaleKeys.neighbours.tr()),
                      CmoCardItem(
                        title: LocaleKeys.local_neighbours.tr(),
                        value: '${data.farmDashBoardInfo?.totalStakeholder}',
                      ),
                    ],
                  );
                },
              ),
            ),
            // Hide it
            // const SizedBox(height: 20),
            // CmoCard(
            //   backgroundColor: context.colors.grey,
            //   trailing: const SizedBox.shrink(),
            //   content: [
            //     CmoCardHeader(title: LocaleKeys.cars.tr()),
            //     CmoCardItem(title: LocaleKeys.opened.tr(), value: '1'),
            //     CmoCardItem(title: LocaleKeys.closed.tr(), value: '1'),
            //   ],
            // ),
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
