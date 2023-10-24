import 'package:freezed_annotation/freezed_annotation.dart';

part 'grievance_register_payload.freezed.dart';
part 'grievance_register_payload.g.dart';

@freezed
class GrievanceRegisterPayLoad with _$GrievanceRegisterPayLoad {
  const factory GrievanceRegisterPayLoad({
    String? GrievanceRegisterNo,
    String? FarmId,
    String? WorkerId,
    String? GrievanceRegisterId,
    num? GrievanceIssueId,
    DateTime? DateReceived,
    String? AllocatedToUserId,
    String? ActionTaken,
    String? ClosureDetails,
    DateTime? DateClosed,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? WorkerName,
    String? AllocatedToName,
    String? GrievanceIssueName,
    DateTime? CreateDT,
    DateTime? UpdateDT,
  }) = _GrievanceRegisterPayLoad;
  factory GrievanceRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$GrievanceRegisterPayLoadFromJson(json);
}
