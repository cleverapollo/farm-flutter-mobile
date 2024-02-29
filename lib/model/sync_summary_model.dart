import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'sync_summary_model.freezed.dart';

@freezed
class SyncSummaryModel with _$SyncSummaryModel {
  const factory SyncSummaryModel({
    int? adInprogress,
    int? adUnsynced,
    int? schedulerUpcommingEvent,
    int? mdCompany,
    int? mdQuestion,
    int? mdWoker,
    int? mdUnsyncWoker,
    int? mdTeam,
    int? mdRejectReason,
    int? mdPlantation,
    int? mdContractor,
    int? mdJobCategory,
    int? mdJobDescription,
    int? mdElement,
    int? mdPdca,
    int? mdSeverity,
    int? mdSpeqs,
    int? mdCompliance,
    int? mdMmm,
    int? mdImpactCaused,
    int? mdImpactOn,
    int? mdUnit,
    int? mdProvince,
    int? mdMunicipality,
    int? mdScheduleActivity,
    int? mdTrainingProvider,
    int? mdCourse,
  }) = _SyncSummaryModel;
}
