import 'package:cmo/ui/screens/behave/sync_summary/widget/sync_summary_item_widget.dart';
import 'package:flutter/cupertino.dart';

enum SyncSummaryEnum {
  assessmentDetails,
  scheduler,
  masterData,
  all;

  const SyncSummaryEnum();

  String get getLabel {
    switch (this) {
      case SyncSummaryEnum.assessmentDetails:
        return 'Assessment Details';
      case SyncSummaryEnum.scheduler:
        return 'Scheduler';
      case SyncSummaryEnum.masterData:
        return 'Master Data';
      case SyncSummaryEnum.all:
        return '';
    }
  }

  List<Widget> get getViews {
    if (isAll) {
      return <Widget>[
        assessmentDetails.getView,
        scheduler.getView,
        masterData.getView,
      ];
    }
    return [];
  }

  Widget get getView {
    return SyncSummaryItemWidget(this);
  }

  bool get isAll {
    if (this == SyncSummaryEnum.all) {
      return true;
    }
    return false;
  }
}
