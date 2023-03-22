// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Schedule with _$Schedule {

  const factory Schedule({
    @JsonKey(name: 'ScheduleId') required String scheduleId,
    @JsonKey(name: 'Start') String? start,
    @JsonKey(name: 'End') String? end,
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'DestinationCompanyId') int? destinationCompanyId,
    @JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'CourseId') int? courseId,
    @JsonKey(name: 'TrainingProviderId') int? trainingProviderId,
    @JsonKey(name: 'PlantationId') int? plantationId,
    @JsonKey(name: 'Venue') String? venue,
    @JsonKey(name: 'Invoice') String? invoice,
    @JsonKey(name: 'Candidate') String? candidate,
    @JsonKey(name: 'Certificate') String? certificate,
    @JsonKey(name: 'ContactPerson') String? contactPerson,
    @JsonKey(name: 'intOfAttendees') int? intOfAttendees,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'DestinationCompanyName') String? destinationCompanyName,
    @JsonKey(name: 'ScheduleActivityName') String? scheduleActivityName,
    @JsonKey(name: 'ContractorName') String? contractorName,
    @JsonKey(name: 'CourseName') String? courseName,
    @JsonKey(name: 'TrainingProviderName') String? trainingProviderName,
    @JsonKey(name: 'PlantationName') String? plantationName,
    @JsonKey(name: 'PotentialCompany') String? potentialCompany,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  const Schedule._();

  @override
  Id get id => Isar.autoIncrement;
}
