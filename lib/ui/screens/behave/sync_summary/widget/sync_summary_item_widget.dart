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
        SyncPairItemModel('Company', count: state.data?.mdCompany),
        SyncPairItemModel('Question', count: state.data?.mdQuestion),
        SyncPairItemModel('Worker', count: state.data?.mdWoker),
        SyncPairItemModel('Unsync Worker', count: state.data?.mdUnsyncWoker),
        SyncPairItemModel('Team', count: state.data?.mdTeam),
        SyncPairItemModel('Reject Reason', count: state.data?.mdRejectReason),
        SyncPairItemModel('Plantation', count: state.data?.mdPlantation),
        SyncPairItemModel('Contractor', count: state.data?.mdContractor),
        SyncPairItemModel('Job Category', count: state.data?.mdJobCategory),
        SyncPairItemModel('Job Description',
            count: state.data?.mdJobDescription),
        SyncPairItemModel('Job Element', count: state.data?.mdElement),
        SyncPairItemModel('Pdca', count: state.data?.mdPdca),
        SyncPairItemModel('Severity', count: state.data?.mdSeverity),
        SyncPairItemModel('Speqs', count: state.data?.mdSpeqs),
        SyncPairItemModel('Compliance', count: state.data?.mdCompliance),
        SyncPairItemModel('Mmm', count: state.data?.mdMmm),
        SyncPairItemModel('Impact Caused', count: state.data?.mdImpactCaused),
        SyncPairItemModel('Impact On', count: state.data?.mdImpactOn),
        SyncPairItemModel('Unit', count: state.data?.mdUnit),
        SyncPairItemModel('Province', count: state.data?.mdProvince),
        SyncPairItemModel('Municipality', count: state.data?.mdMunicipality),
        SyncPairItemModel('Schedule Activity',
            count: state.data?.mdScheduleActivity),
        SyncPairItemModel('Training Provider',
            count: state.data?.mdTrainingProvider),
        SyncPairItemModel('Course', count: state.data?.mdCourse),
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
              first: widget.syncSummaryEnum.getLabel,
              isTitle: true,
            ),
            SyncItemWidget(
              first: 'In Progress',
              count: state.data?.adInprogress,
            ),
            SyncItemWidget(
              first: 'Un Synced',
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
          first: widget.syncSummaryEnum.getLabel,
          isTitle: true,
        ),
        SyncItemWidget(
          first: 'Upcomming Event',
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
                first: widget.syncSummaryEnum.getLabel,
                isTitle: true,
              ),
              ...data.map((e) => SyncItemWidget(
                    first: e.title,
                    count: e.count,
                  ))
            ],
          );
        });
  }
}
