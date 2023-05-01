import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'employee_grievance.freezed.dart';

part 'employee_grievance.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class EmployeeGrievance with _$EmployeeGrievance {
  const factory EmployeeGrievance({
    @JsonKey(name: 'EmployeeGrievanceId') int? employeeGrievanceId,
    @JsonKey(name: 'WorkerName') String? workerName,
    @JsonKey(name: 'WorkerId') int? workerId,
    @JsonKey(name: 'GrievanceIssue') String? grievanceIssue,
    @JsonKey(name: 'GrievanceIssueId') int? grievanceIssueId,
    @JsonKey(name: 'AllocatedTo') String? allocatedTo,
    @JsonKey(name: 'AllocatedToId') int? allocatedToId,
    @JsonKey(name: 'ClosureDetails') String? closureDetails,
    @JsonKey(name: 'ActionTaken') String? actionTaken,
    @JsonKey(name: 'GeneralComments') String? generalComments,
    @JsonKey(name: 'DateReceived') String? dateReceived,
    @JsonKey(name: 'DateClosed') String? dateClosed,
    @Default(false) @JsonKey(name: 'CarRaised') bool? carRaised,
    @Default(false) @JsonKey(name: 'CarClosed') bool? carClosed,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _EmployeeGrievance;

  const EmployeeGrievance._();

  factory EmployeeGrievance.fromJson(Map<String, dynamic> json) => _$EmployeeGrievanceFromJson(json);

  @override
  Id get id => employeeGrievanceId ?? Isar.autoIncrement;
}
