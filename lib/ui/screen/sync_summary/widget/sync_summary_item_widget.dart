import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../di.dart';
import '../sync_summary_enum.dart';

class SyncSummaryItemWidget extends StatelessWidget {
  SyncSummaryItemWidget(this.syncSummaryEnum, {super.key});
  final SyncSummaryEnum syncSummaryEnum;

  final databaseService = cmoDatabaseMasterService;

  @override
  Widget build(BuildContext context) {
    switch (syncSummaryEnum) {
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
    return Column(
      children: [
        _BuildPairItemWidget(
          first: syncSummaryEnum.getLabel,
          second: 'Record Count',
          isTitle: true,
        ),
        _BuildPairItemWidget(
          first: 'In Progress',
          second: '0',
        ),
        _BuildPairItemWidget(
          first: 'Un Synced',
          second: '0',
          isHighlight: true,
        ),
      ],
    );
  }

  Widget _buildScheduler() {
    return Column(
      children: [
        _BuildPairItemWidget(
          first: syncSummaryEnum.getLabel,
          second: 'Record Count',
          isTitle: true,
        ),
        _BuildPairItemWidget(
          first: 'Upcomming Event',
          second: '0',
        ),
      ],
    );
  }

  Widget _buildMasterData() {
    return Column(
      children: [
        _BuildPairItemWidget(
          first: syncSummaryEnum.getLabel,
          second: 'Record Count',
          isTitle: true,
        ),
        ...masterDatas
            .map((e) => _BuildPairItemWidget(first: e.title, second: '0'))
      ],
    );
  }
}

class _BuildPairItemWidget extends StatelessWidget {
  const _BuildPairItemWidget({
    super.key,
    required this.first,
    required this.second,
    this.isTitle = false,
    this.isHighlight = false,
  });

  final String first;
  final String second;
  final bool isTitle;
  final bool isHighlight;

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
                    second,
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
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      second,
                      style: isTitle
                          ? context.textStyles.titleBold
                          : context.textStyles.bodyNormal.copyWith(
                              color: isHighlight
                                  ? Colors.amberAccent
                                  : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

List<_BuildPairModel> masterDatas = [
  _BuildPairModel('Company'),
  _BuildPairModel('Question'),
  _BuildPairModel('Worker'),
  _BuildPairModel('Unsync Worker'),
  _BuildPairModel('Team'),
  _BuildPairModel('Reject Reason'),
  _BuildPairModel('Plantation'),
  _BuildPairModel('Contractor'),
  _BuildPairModel('Job Category'),
  _BuildPairModel('Job Description'),
  _BuildPairModel('Job Element'),
  _BuildPairModel('Pdca'),
  _BuildPairModel('Severity'),
  _BuildPairModel('Speqs'),
  _BuildPairModel('Compliance'),
  _BuildPairModel('Mmm'),
  _BuildPairModel('Impact Caused'),
  _BuildPairModel('Impact On'),
  _BuildPairModel('Unit'),
  _BuildPairModel('Province'),
  _BuildPairModel('Municipality'),
  _BuildPairModel('Schedule Activity'),
  _BuildPairModel('Training Provider'),
  _BuildPairModel('Course'),
];

class _BuildPairModel {
  _BuildPairModel(this.title, {this.future});

  final String title;
  final Future? future;
}
