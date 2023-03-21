// To parse this JSON data, do
//
//     final assessment = assessmentFromJson(jsonString);

// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member, sort_unnamed_constructors_first, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'assessment.freezed.dart';
part 'assessment.g.dart';

// status = 1 -> Started;
// status = 2 -> Completed;
// status = 3 -> Synced;
enum AssessmentStatus {
  unknown(0),
  started(1),
  completed(2),
  synced(3),
  ;

  const AssessmentStatus(
    this.data,
  );

  final int data;
}

@freezed
@Collection(ignore: {'copyWith'})
class Assessment with _$Assessment {
  const factory Assessment({
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'UserId') int? userId,
//
    @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'PlantationId') int? plantationId,
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'TeamId') int? teamId,
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'Lat') double? lat,
    @JsonKey(name: 'Long') double? long,
    @JsonKey(name: 'Location') String? location,
//
// * only use for show UI
    @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
    @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
    @JsonKey(name: 'PlantationName') String? plantationName,
    @JsonKey(name: 'ContractorName') String? contractorName,
    @JsonKey(name: 'TeamName') String? teamName,
    @JsonKey(name: 'WorkerName') String? workerName,
// *
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _Assessment;

  const Assessment._();

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);

  @override
  Id get id => assessmentId ?? Isar.autoIncrement;
}

extension AssessmentX on Assessment {
  AssessmentStatus get statusEnum {
    switch (this.status) {
      case 0:
        return AssessmentStatus.unknown;
      case 1:
        return AssessmentStatus.started;
      case 2:
        return AssessmentStatus.completed;
      case 3:
        return AssessmentStatus.synced;
      default:
        return AssessmentStatus.unknown;
    }
  }

  int status(AssessmentStatus type) {
    switch (type) {
      case AssessmentStatus.unknown:
        return 0;
      case AssessmentStatus.started:
        return 1;
      case AssessmentStatus.completed:
        return 2;
      case AssessmentStatus.synced:
        return 3;
    }
  }
}
