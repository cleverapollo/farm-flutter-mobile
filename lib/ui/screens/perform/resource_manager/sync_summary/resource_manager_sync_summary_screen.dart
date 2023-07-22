import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceManagerSyncSummaryScreen extends StatefulWidget {
  const ResourceManagerSyncSummaryScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RMSyncCubit(
            userInfoCubit: context.read<UserInfoCubit>(),
            userDeviceCubit: context.read<UserDeviceCubit>(),
          ),
          child: const ResourceManagerSyncSummaryScreen(),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() =>
      _ResourceManagerSyncSummaryScreenState();
}

class _ResourceManagerSyncSummaryScreenState
    extends State<ResourceManagerSyncSummaryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<RMSyncCubit>().getSummaryInformation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.syncSummary.tr(),
        showLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Stack(
          children: [
            BlocSelector<RMSyncCubit, RMSyncState, RmSyncSummaryInformation?>(
              selector: (state) => state.rmSyncSummaryInformation,
              builder: (context, summaryInformation) {
                if (summaryInformation == null) return const SizedBox.shrink();
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      SyncItemWidget(
                          label: LocaleKeys.audit_detail.tr(), isTitle: true),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.unsynced.tr(),
                        count: summaryInformation.unsyncedAudit,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.in_progress.tr(),
                        count: summaryInformation.inProgressAudit,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.farm.tr(),
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.unsynced.tr(),
                        count: summaryInformation.unsyncedFarm,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.totalFarm.tr(),
                        count: summaryInformation.totalFarms,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.master_data.tr(),
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.auditTemplates.tr(),
                        count: summaryInformation.auditTemplates,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.compliances.tr(),
                        count: summaryInformation.compliances,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.criteria.tr(),
                        count: summaryInformation.criteria,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.farm_member_objectives.tr(),
                        count: summaryInformation.farmMemberObjectives,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.farm_objectives_options.tr(),
                        count: summaryInformation.farmObjectivesOptions,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.farm_property_ownership_types.tr(),
                        count: summaryInformation.farmPropertyOwnershipTypes,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.groupScheme.tr(),
                        count: summaryInformation.groupScheme,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.impact_caused.tr(),
                        count: summaryInformation.impactCaused,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.impact_on.tr(),
                        count: summaryInformation.impactOn,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.indicators.tr(),
                        count: summaryInformation.indicators,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.principle.tr(),
                        count: summaryInformation.principle,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.question.tr(),
                        count: summaryInformation.question,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.resource_management_units.tr(),
                        count: summaryInformation.resourceManagementUnits,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.reject_reasons.tr(),
                        count: summaryInformation.rejectReasons,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.risk_profile_questions.tr(),
                        count: summaryInformation.riskProfileQuestions,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.severity.tr(),
                        count: summaryInformation.severity,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.stakeholders.tr(),
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.unsynced.tr(),
                        count: summaryInformation.unsyncedStakeholders,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                          label: LocaleKeys.group_scheme_stakeholders.tr(),
                          isTitle: true),
                      const SizedBox(
                        height: 16,
                      ),
                      SyncItemWidget(
                        label: LocaleKeys.stakeholder_types.tr(),
                        count: summaryInformation.stakeholderTypes,
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .padding
                            .bottom + 50,
                      ),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .padding
                      .bottom,
                ),
                child: BlocSelector<RMSyncCubit, RMSyncState, bool>(
                  selector: (state) => state.isLoading,
                  builder: (context, isLoading) {
                    return CmoFilledButton(
                      loading: isLoading,
                      title: LocaleKeys.sync.tr(),
                      onTap: () async {
                        await context.read<RMSyncCubit>().syncSummary(
                          onSuccess: () async {
                            showSnackSuccess(msg: 'The summary sync was successful!');
                            await context.read<DashboardCubit>().initializeRM();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
