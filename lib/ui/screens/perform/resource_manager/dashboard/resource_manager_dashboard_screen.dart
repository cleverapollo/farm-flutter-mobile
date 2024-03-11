import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_management_screen.dart';
import 'package:cmo/ui/screens/perform/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/sync_summary/resource_manager_sync_summary_screen.dart';
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
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.colors.white,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () {
            return context.read<DashboardCubit>().initializeRM();
          },
          child: BlocSelector<DashboardCubit, DashboardState, RMDashboardInfo?>(
            selector: (state) => state.rmDashboardInfo,
            builder: (context, dashboardInfo) {
              return ListView(
                clipBehavior: Clip.none,
                padding: const EdgeInsets.all(20),
                children: [
                  DashboardItemWidget(
                    title: LocaleKeys.members.tr(),
                    icon: Assets.icons.icDashboardMember.svg(),
                    onTap: () => MemberManagementScreen.push(context),
                    listInformationWidget: [
                      CmoCardHeader(title: LocaleKeys.members.tr()),
                      // DashboardInformationItem(
                      //     title: LocaleKeys.onboarded.tr(),
                      //     value: dashboardInfo?.onboardedMembers != null
                      //         ? '${dashboardInfo?.onboardedMembers}/${dashboardInfo?.totalMembers}'
                      //         : '',
                      //   titleTextStyle: context.textStyles.bodyNormal.white,
                      //   valueTextStyle: context.textStyles.bodyNormal.white,
                      // ),
                      // DashboardInformationItem(
                      //     title: LocaleKeys.incomplete.tr(),
                      //     value: dashboardInfo?.onboardedMembers != null
                      //         ? '${dashboardInfo?.incompletedMembers}/${dashboardInfo?.totalMembers}'
                      //         : '',
                      //   titleTextStyle: context.textStyles.bodyNormal.white,
                      //   valueTextStyle: context.textStyles.bodyNormal.white,
                      // ),


                      buildMemberInformationWidget(
                        title: LocaleKeys.onboarded.tr(),
                        firstValue: '${dashboardInfo?.onboardedMembers ?? ''}',
                        secondValue: dashboardInfo?.onboardedMembersArea ?? 0,
                      ),
                      buildMemberInformationWidget(
                        title: LocaleKeys.incomplete.tr(),
                        firstValue: '${dashboardInfo?.incompletedMembers ?? ''}',
                        secondValue: dashboardInfo?.incompleteMembersArea ?? 0,
                      ),
                      buildMemberInformationWidget(
                        title: LocaleKeys.total_members.tr(),
                        firstValue: '${dashboardInfo?.totalMembers ?? ''}',
                        secondValue: dashboardInfo?.totalMembersArea ?? 0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DashboardItemWidget(
                    title: LocaleKeys.audit_s.tr(),
                    icon: Assets.icons.icDashboardAudit.svg(),
                    onTap: () => AuditManagementScreen.push(context),
                    listInformationWidget: [
                      CmoCardHeader(title: LocaleKeys.audit_s.tr()),
                      // DashboardInformationItem(
                      //   title: LocaleKeys.onboarded.tr(),
                      //   value: state.totalCompletedAssessments != null
                      //       ? '${state.totalCompletedAssessments}/${state.totalAssessments}'
                      //       : '',
                      //   titleTextStyle: context.textStyles.bodyNormal.white,
                      //   valueTextStyle: context.textStyles.bodyNormal.white,
                      // ),
                      // DashboardInformationItem(
                      //   title: LocaleKeys.incomplete.tr(),
                      //   value: state.totalIncompleteAssessments != null
                      //       ? '${state.totalIncompleteAssessments}/${state.totalAssessments}'
                      //       : '',
                      //   titleTextStyle: context.textStyles.bodyNormal.white,
                      //   valueTextStyle: context.textStyles.bodyNormal.white,
                      // ),
                      //
                      // DashboardInformationItem(
                      //   title: LocaleKeys.membersOutstanding.tr(),
                      //   value: '${state.totalAssessments ?? ''}',
                      //   titleTextStyle: context.textStyles.bodyBold.orange9736,
                      //   valueTextStyle: context.textStyles.bodyBold.orange9736,
                      // ),
                      DashboardInformationItem(
                        title: LocaleKeys.onboarded.tr(),
                        value: '${state.totalCompletedAssessments ?? ''}',
                        titleTextStyle: context.textStyles.bodyNormal.white,
                        valueTextStyle: context.textStyles.bodyNormal.white,
                      ),
                      DashboardInformationItem(
                        title: LocaleKeys.incomplete.tr(),
                        value: '${state.totalIncompleteAssessments ?? ''}',
                        titleTextStyle: context.textStyles.bodyNormal.white,
                        valueTextStyle: context.textStyles.bodyNormal.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DashboardItemWidget(
                    title: LocaleKeys.stakeholders.tr(),
                    icon: Assets.icons.icDashboardStakeholder.svg(),
                    onTap: () => StakeHolderManagementScreen.push(context),
                    listInformationWidget: [
                      CmoCardHeader(title: LocaleKeys.stakeholders.tr()),
                      // DashboardInformationItem(
                      //   title: LocaleKeys.national.tr(),
                      //   value: '${dashboardInfo?.stakeHolders ?? 0}',
                      //   titleTextStyle: context.textStyles.bodyNormal.white,
                      //   valueTextStyle: context.textStyles.bodyNormal.white,
                      // ),

                      const SizedBox(height: 16,),
                      DashboardInformationItem(
                        title: LocaleKeys.national.tr(),
                        value: (dashboardInfo?.stakeHolders ?? 0).toString(),
                        titleTextStyle: context.textStyles.bodyNormal.white,
                        valueTextStyle: context.textStyles.bodyNormal.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Hide it
                  // CmoCard(
                  //   content: [
                  //     CmoCardHeader(title: LocaleKeys.cars.tr()),
                  //     CmoCardItem(title: LocaleKeys.opened.tr(), value: '5'),
                  //     CmoCardItem(title: LocaleKeys.overdue.tr(), value: '5'),
                  //   ],
                  // ),
                  // const SizedBox(height: 20),

                  DashboardItemWidget(
                    title: LocaleKeys.sync.tr(),
                    icon: Assets.icons.icDashboardSync.svg(),
                    onTap: () => ResourceManagerSyncSummaryScreen.push(context),
                    listInformationWidget: [
                      CmoCardHeader(title: LocaleKeys.sync.tr()),
                      // DashboardInformationItem(
                      //   title: LocaleKeys.audits.tr(),
                      //   value: (dashboardInfo?.unsynced ?? 0).toString(),
                      //   titleTextStyle: context.textStyles.bodyNormal.white,
                      //   valueTextStyle: context.textStyles.bodyNormal.white,
                      // ),
                      const SizedBox(height: 16,),
                      DashboardInformationItem(
                        title: LocaleKeys.audits.tr(),
                        value: (dashboardInfo?.unsynced ?? 0).toString(),
                        titleTextStyle: context.textStyles.bodyNormal.white,
                        valueTextStyle: context.textStyles.bodyNormal.white,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget buildMemberInformationWidget({
    required String title,
    required String firstValue,
    required double secondValue,
    TextStyle? textStyle,
    TextStyle? secondValueTextStyle,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '$title:',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle ?? context.textStyles.bodyNormal.white,
              ),
            ),
        ),
        Expanded(
          child: Text(
            firstValue,
            textAlign: TextAlign.center,
            style: textStyle ?? context.textStyles.bodyNormal.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '${secondValue.toStringAsFixed(2)} ha',
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: secondValueTextStyle ?? context.textStyles.bodyNormal.white,
          ),
        ),
      ],
    );
  }
}

class DashboardInformationItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleTextStyle;
  final TextStyle? valueTextStyle;

  const DashboardInformationItem({
    required this.title,
    required this.value,
    this.titleTextStyle,
    this.valueTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$title:',
            style: titleTextStyle ?? context.textStyles.bodyNormal.blueDark2,
          ),
        ),
        Text(
          value,
          style: valueTextStyle ?? context.textStyles.bodyNormal.blueDark2,
        ),
      ],
    );
  }
}

class DashboardItemWidget extends StatelessWidget {
  DashboardItemWidget({
    required this.title,
    required this.icon,
    required this.listInformationWidget,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final List<Widget> listInformationWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CmoCard(
      // backgroundColor: context.colors.white,
      // shouldShowArrowRight: false,
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
        color: Colors.white,
      ),
      onTap: onTap,
      padding: const EdgeInsets.all(10),
      content: [
        // Row(
        //   children: [
            // icon,
            // const SizedBox(
            //   width: 20,
            // ),
        //     Expanded(
        //       child: Text(
        //         title,
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //         style: context.textStyles.bodyBold
        //             .copyWith(fontSize: 20)
        //             .blueDark2,
        //       ),
        //     ),
        //     Assets.icons.icArrowRight.svgBlack,
        //   ],
        // ),
        // const SizedBox(
        //   height: 12,
        // ),
        ...listInformationWidget,
      ],
    );
  }
}
