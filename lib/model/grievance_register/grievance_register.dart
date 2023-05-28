import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'grievance_register.freezed.dart';

part 'grievance_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GrievanceRegister with _$GrievanceRegister {
  const factory GrievanceRegister({
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
    @JsonKey(name: 'IsActive') bool? ssActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'WorkerName') String? workerName,
    @JsonKey(name: 'AllocatedToName') String? allocatedToName,
    @JsonKey(name: 'GrievanceIssueName') String? grievanceIssueName,
  }) = _GrievanceRegister;

  const GrievanceRegister._();

  factory GrievanceRegister.fromJson(Map<String, dynamic> json) =>
      _$GrievanceRegisterFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
