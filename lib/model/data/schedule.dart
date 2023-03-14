import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @JsonKey(name: 'ScheduleId') String? scheduleId,
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

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}
