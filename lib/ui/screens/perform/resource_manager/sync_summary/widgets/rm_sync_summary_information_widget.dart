import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RmSyncSummaryInformationWidget extends StatelessWidget {

  const RmSyncSummaryInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RMSyncCubit, RMSyncState, RmSyncSummaryInformation?>(
      selector: (state) => state.rmSyncSummaryInformation,
      builder: (context, summaryInformation) {
        if (summaryInformation == null) return const SizedBox.shrink();
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              SyncItemWidget(
                label: LocaleKeys.audit_detail.tr(),
                isTitle: true,
              ),
              const SizedBox(
                height: 16,
              ),
              SyncItemWidget(
                label: LocaleKeys.total_audits.tr(),
                count: summaryInformation.totalAudits,
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
                label: LocaleKeys.total_stakeholders.tr(),
                count: summaryInformation.totalStakeholders,
              ),
              const SizedBox(
                height: 16,
              ),
              SyncItemWidget(
                label: LocaleKeys.group_scheme_stakeholders.tr(),
                isTitle: true,
              ),
              const SizedBox(
                height: 16,
              ),
              SyncItemWidget(
                label: LocaleKeys.stakeholder_types.tr(),
                count: summaryInformation.stakeholderTypes,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
