import 'package:cmo/ui/screens/behave/sync_summary/widget/sync_summary_item_widget.dart';
import 'package:flutter/cupertino.dart';

enum BehaveSyncSummaryEnum {
  assessmentDetails,
  scheduler,
  masterData,
  all;

  const BehaveSyncSummaryEnum();

  String get getLabel {
    switch (this) {
      case BehaveSyncSummaryEnum.assessmentDetails:
        return 'Assessment Details';
      case BehaveSyncSummaryEnum.scheduler:
        return 'Scheduler';
      case BehaveSyncSummaryEnum.masterData:
        return 'Master Data';
      case BehaveSyncSummaryEnum.all:
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
    return BehaveSyncSummaryItemWidget(this);
  }

  bool get isAll {
    if (this == BehaveSyncSummaryEnum.all) {
      return true;
    }
    return false;
  }
}
