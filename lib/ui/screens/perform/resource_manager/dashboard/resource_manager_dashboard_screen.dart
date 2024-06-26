import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/global_entity.dart';
import 'package:cmo/ui/screens/perform/action_log/management/action_log_management.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_management_screen.dart';
import 'package:cmo/ui/screens/perform/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/sync_summary/resource_manager_sync_summary_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceManagerDashboardScreen extends BaseStatefulWidget {
  const ResourceManagerDashboardScreen({super.key}) : super(screenName: 'ResourceManagerDashboardScreen');

  @override
  State<StatefulWidget> createState() => _ResourceManagerDashboardScreenState();
}

class _ResourceManagerDashboardScreenState extends BaseStatefulWidgetState<ResourceManagerDashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<DashboardCubit>().initializeRM();
      final isRMSyncedSuccessful = await configService.isRMSynced();
      if (!isRMSyncedSuccessful) {
        await onSyncFailure();
      }
    });
  }

  Future<void> onSyncFailure() async {
    await onShowWarningDialog(
      context,
      title: LocaleKeys.sync_failed.tr(),
      subtitle: LocaleKeys.sync_onboarding_failed_message.tr(),
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.close.tr(),
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  GlobalEntityScreen.push(
                    context,
                    canNavigateBack: true,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.sync_again.tr(),
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
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
                    onTap: () => ResourceManagerSyncSummaryScreen.push(context),
                    listInformationWidget: [
                      const SizedBox(height: 16,),
                      CmoCardHeader(title: '${LocaleKeys.sync.tr()}(${LocaleKeys.upload.tr()})'),
                      const SizedBox(height: 16,),
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
    final convertSecondValue = context.read<SettingsCubit>().state.settingConfig.areaUnitEnum.convertHaToDisplayAreaUnit(secondValue);

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
            '${convertSecondValue?.toStringAsFixed(2)} $areaUnit',
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
