import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'sync_summary_model.freezed.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SyncSummaryModel with _$SyncSummaryModel {
  const factory SyncSummaryModel({
    num? adInprogress,
    num? adUnsynced,
    num? schedulerUpcommingEvent,
    num? mdCompany,
    num? mdQuestion,
    num? mdWoker,
    num? mdUnsyncWoker,
    num? mdTeam,
    num? mdRejectReason,
    num? mdPlantation,
    num? mdContractor,
    num? mdJobCategory,
    num? mdJobDescription,
    num? mdElement,
    num? mdPdca,
    num? mdSeverity,
    num? mdSpeqs,
    num? mdCompliance,
    num? mdMmm,
    num? mdImpactCaused,
    num? mdImpactOn,
    num? mdUnit,
    num? mdProvince,
    num? mdMunicipality,
    num? mdScheduleActivity,
    num? mdTrainingProvider,
    num? mdCourse,
  }) = _SyncSummaryModel;
}
