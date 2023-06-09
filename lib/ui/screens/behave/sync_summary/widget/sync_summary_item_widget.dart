import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/l10n/locale_keys.g.dart';
import 'package:cmo/state/behave_sync_summary_cubit/sync_summary_cubit.dart';
import 'package:cmo/state/behave_sync_summary_cubit/sync_summary_state.dart';
import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../behave_sync_summary_enum.dart';

class BehaveSyncSummaryItemWidget extends StatefulWidget {
  const BehaveSyncSummaryItemWidget(this.syncSummaryEnum, {super.key});
  final BehaveSyncSummaryEnum syncSummaryEnum;

  @override
  State<BehaveSyncSummaryItemWidget> createState() =>
      _BehaveSyncSummaryItemWidgetState();
}

class _BehaveSyncSummaryItemWidgetState
    extends State<BehaveSyncSummaryItemWidget> {
  late final SyncSummaryCubit cubit;
  late final SyncSummaryState state;

  List<SyncPairItemModel> data = [];

  @override
  void initState() {
    super.initState();
    cubit = context.read<SyncSummaryCubit>();
    state = cubit.state;
    if (state.dataLoaded) {
      data = [
        SyncPairItemModel(LocaleKeys.company.tr(), count: state.data?.mdCompany),
        SyncPairItemModel(LocaleKeys.question.tr(), count: state.data?.mdQuestion),
        SyncPairItemModel(LocaleKeys.worker.tr(), count: state.data?.mdWoker),
        SyncPairItemModel(LocaleKeys.unsync_worker.tr(), count: state.data?.mdUnsyncWoker),
        SyncPairItemModel(LocaleKeys.team.tr(), count: state.data?.mdTeam),
        SyncPairItemModel(LocaleKeys.reject_reason.tr(), count: state.data?.mdRejectReason),
        SyncPairItemModel(LocaleKeys.plantation.tr(), count: state.data?.mdPlantation),
        SyncPairItemModel(LocaleKeys.contractor.tr(), count: state.data?.mdContractor),
        SyncPairItemModel(LocaleKeys.job_category.tr(), count: state.data?.mdJobCategory),
        SyncPairItemModel(LocaleKeys.jobDescription.tr(),
            count: state.data?.mdJobDescription),
        SyncPairItemModel(LocaleKeys.jobElement.tr(), count: state.data?.mdElement),
        SyncPairItemModel(LocaleKeys.pdca.tr(), count: state.data?.mdPdca),
        SyncPairItemModel(LocaleKeys.severity.tr(), count: state.data?.mdSeverity),
        SyncPairItemModel(LocaleKeys.speqs.tr(), count: state.data?.mdSpeqs),
        SyncPairItemModel(LocaleKeys.compliance.tr(), count: state.data?.mdCompliance),
        SyncPairItemModel(LocaleKeys.mmm.tr(), count: state.data?.mdMmm),
        SyncPairItemModel(LocaleKeys.impact_caused.tr(), count: state.data?.mdImpactCaused),
        SyncPairItemModel(LocaleKeys.impact_on.tr(), count: state.data?.mdImpactOn),
        SyncPairItemModel(LocaleKeys.unit.tr(), count: state.data?.mdUnit),
        SyncPairItemModel(LocaleKeys.province.tr(), count: state.data?.mdProvince),
        SyncPairItemModel(LocaleKeys.municipality.tr(), count: state.data?.mdMunicipality),
        SyncPairItemModel(LocaleKeys.schedule_activity.tr(), count: state.data?.mdScheduleActivity),
        SyncPairItemModel(LocaleKeys.training_provider.tr(), count: state.data?.mdTrainingProvider),
        SyncPairItemModel(LocaleKeys.course.tr(), count: state.data?.mdCourse),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return _handleSyncSummaryItemWidget();
  }

  Widget _handleSyncSummaryItemWidget() {
    switch (widget.syncSummaryEnum) {
      case BehaveSyncSummaryEnum.assessmentDetails:
        return _buildAssessmentDetails();
      case BehaveSyncSummaryEnum.scheduler:
        return _buildScheduler();
      case BehaveSyncSummaryEnum.masterData:
        return _buildMasterData();
      case BehaveSyncSummaryEnum.all:
        return const SizedBox();
    }
  }

  Widget _buildAssessmentDetails() {
    return BlocBuilder<SyncSummaryCubit, SyncSummaryState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (_, state) {
        return Column(
          children: [
            SyncItemWidget(
              label: widget.syncSummaryEnum.getLabel,
              isTitle: true,
            ),
            SyncItemWidget(
              label: 'In Progress',
              count: state.data?.adInprogress,
            ),
            SyncItemWidget(
              label: 'Un Synced',
              count: state.data?.adUnsynced,
              isHighlight: true,
            ),
          ],
        );
      },
    );
  }

  Widget _buildScheduler() {
    return Column(
      children: [
        SyncItemWidget(
          label: widget.syncSummaryEnum.getLabel,
          isTitle: true,
        ),
        SyncItemWidget(
          label: 'Upcomming Event',
          count: state.data?.schedulerUpcommingEvent,
        ),
      ],
    );
  }

  Widget _buildMasterData() {
    return BlocBuilder<SyncSummaryCubit, SyncSummaryState>(
        buildWhen: (previous, current) => previous.data != current.data,
        builder: (_, state) {
          return Column(
            children: [
              SyncItemWidget(
                label: widget.syncSummaryEnum.getLabel,
                isTitle: true,
              ),
              ...data.map((e) => SyncItemWidget(
                    label: e.title,
                    count: e.count,
                  ))
            ],
          );
        });
  }
}
