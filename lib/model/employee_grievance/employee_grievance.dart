import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'employee_grievance.freezed.dart';

part 'employee_grievance.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class EmployeeGrievance with _$EmployeeGrievance {
  const factory EmployeeGrievance({
    @JsonKey(name: 'GrievanceRegisterNo') String? grievanceRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'GrievanceRegisterId') String? grievanceRegisterId,
    @JsonKey(name: 'GrievanceIssueId') int? grievanceIssueId,
    @JsonKey(name: 'DateReceived') DateTime? dateReceived,
    @JsonKey(name: 'AllocatedToUserId') String? allocatedToUserId,
    @JsonKey(name: 'ActionTaken') String? actionTaken,
    @JsonKey(name: 'ClosureDetails') String? closureDetails,
    @JsonKey(name: 'DateClosed') DateTime? dateClosed,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
    @JsonKey(name: 'WorkerName') String? workerName,
    @JsonKey(name: 'AllocatedToName') String? allocatedToName,
    @JsonKey(name: 'GrievanceIssueName') String? grievanceIssueName,
  }) = _EmployeeGrievance;

  const EmployeeGrievance._();

  factory EmployeeGrievance.fromJson(Map<String, dynamic> json) =>
      _$EmployeeGrievanceFromJson(json);

  @override
  Id get id => int.tryParse(grievanceRegisterId ?? '') ?? Isar.autoIncrement;
}
