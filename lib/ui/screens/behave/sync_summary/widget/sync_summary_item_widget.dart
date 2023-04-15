import 'package:cmo/state/sync_summary_cubit/sync_summary_cubit.dart';
import 'package:cmo/state/sync_summary_cubit/sync_summary_state.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sync_summary_enum.dart';

class SyncSummaryItemWidget extends StatefulWidget {
  const SyncSummaryItemWidget(this.syncSummaryEnum, {super.key});
  final SyncSummaryEnum syncSummaryEnum;

  @override
  State<SyncSummaryItemWidget> createState() => _SyncSummaryItemWidgetState();
}

class _SyncSummaryItemWidgetState extends State<SyncSummaryItemWidget> {
  late final SyncSummaryCubit cubit;
  late final SyncSummaryState state;

  List<_BuildPairModel> data = [];

  @override
  void initState() {
    super.initState();
    cubit = context.read<SyncSummaryCubit>();
    state = cubit.state;
    if (state.dataLoaded) {
      data = [
        _BuildPairModel('Company', count: state.data?.mdCompany),
        _BuildPairModel('Question', count: state.data?.mdQuestion),
        _BuildPairModel('Worker', count: state.data?.mdWoker),
        _BuildPairModel('Unsync Worker', count: state.data?.mdUnsyncWoker),
        _BuildPairModel('Team', count: state.data?.mdTeam),
        _BuildPairModel('Reject Reason', count: state.data?.mdRejectReason),
        _BuildPairModel('Plantation', count: state.data?.mdPlantation),
        _BuildPairModel('Contractor', count: state.data?.mdContractor),
        _BuildPairModel('Job Category', count: state.data?.mdJobCategory),
        _BuildPairModel('Job Description', count: state.data?.mdJobDescription),
        _BuildPairModel('Job Element', count: state.data?.mdElement),
        _BuildPairModel('Pdca', count: state.data?.mdPdca),
        _BuildPairModel('Severity', count: state.data?.mdSeverity),
        _BuildPairModel('Speqs', count: state.data?.mdSpeqs),
        _BuildPairModel('Compliance', count: state.data?.mdCompliance),
        _BuildPairModel('Mmm', count: state.data?.mdMmm),
        _BuildPairModel('Impact Caused', count: state.data?.mdImpactCaused),
        _BuildPairModel('Impact On', count: state.data?.mdImpactOn),
        _BuildPairModel('Unit', count: state.data?.mdUnit),
        _BuildPairModel('Province', count: state.data?.mdProvince),
        _BuildPairModel('Municipality', count: state.data?.mdMunicipality),
        _BuildPairModel('Schedule Activity',
            count: state.data?.mdScheduleActivity),
        _BuildPairModel('Training Provider',
            count: state.data?.mdTrainingProvider),
        _BuildPairModel('Course', count: state.data?.mdCourse),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return _handleSyncSummaryItemWidget();
  }

  Widget _handleSyncSummaryItemWidget() {
    switch (widget.syncSummaryEnum) {
      case SyncSummaryEnum.assessmentDetails:
        return _buildAssessmentDetails();
      case SyncSummaryEnum.scheduler:
        return _buildScheduler();
      case SyncSummaryEnum.masterData:
        return _buildMasterData();
      case SyncSummaryEnum.all:
        return const SizedBox();
    }
  }

  Widget _buildAssessmentDetails() {
    return BlocBuilder<SyncSummaryCubit, SyncSummaryState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (_, state) {
        return Column(
          children: [
            _BuildPairItemWidget(
              first: widget.syncSummaryEnum.getLabel,
              isTitle: true,
            ),
            _BuildPairItemWidget(
              first: 'In Progress',
              count: state.data?.adInprogress,
            ),
            _BuildPairItemWidget(
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
        _BuildPairItemWidget(
          first: widget.syncSummaryEnum.getLabel,
          isTitle: true,
        ),
        _BuildPairItemWidget(
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
              _BuildPairItemWidget(
                first: widget.syncSummaryEnum.getLabel,
                isTitle: true,
              ),
              ...data.map((e) => _BuildPairItemWidget(
                    first: e.title,
                    count: e.count,
                  ))
            ],
          );
        });
  }
}

class _BuildPairItemWidget extends StatelessWidget {
  const _BuildPairItemWidget({
    super.key,
    required this.first,
    this.isTitle = false,
    this.isHighlight = false,
    this.count = 0,
  });

  final String first;
  final bool isTitle;
  final bool isHighlight;
  final num? count;

  @override
  Widget build(BuildContext context) {
    return isTitle
        ? Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
            color: context.colors.blueDark1,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    first,
                    style: isTitle
                        ? context.textStyles.titleBold
                            .copyWith(color: context.colors.white)
                        : context.textStyles.bodyNormal.copyWith(
                            color: isHighlight
                                ? context.colors.yellow
                                : context.colors.black),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Record Count',
                    style: isTitle
                        ? context.textStyles.titleBold
                            .copyWith(color: Colors.white)
                        : context.textStyles.bodyBold.copyWith(
                            color: isHighlight
                                ? Colors.amberAccent
                                : Colors.black),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        first,
                        style: isTitle
                            ? context.textStyles.titleBold
                            : context.textStyles.bodyNormal.copyWith(
                                color: isHighlight
                                    ? Colors.amberAccent
                                    : Colors.black),
                      )),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text('${count ?? '*'}',
                        style: isTitle
                            ? context.textStyles.titleBold
                            : context.textStyles.bodyNormal.copyWith(
                                color: isHighlight
                                    ? Colors.amberAccent
                                    : Colors.black)),
                  ),
                ],
              ),
            ),
          );
  }
}

class _BuildPairModel {
  _BuildPairModel(this.title, {this.count});

  final String title;
  final num? count;
}
