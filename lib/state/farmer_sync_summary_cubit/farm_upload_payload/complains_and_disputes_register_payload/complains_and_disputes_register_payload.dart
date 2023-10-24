import 'package:freezed_annotation/freezed_annotation.dart';

part 'complains_and_disputes_register_payload.freezed.dart';
part 'complains_and_disputes_register_payload.g.dart';

@freezed
class ComplainsAndDisputesRegisterPayLoad
    with _$ComplainsAndDisputesRegisterPayLoad {
  const factory ComplainsAndDisputesRegisterPayLoad({
    String? ComplaintsAndDisputesRegisterNo,
    String? FarmId,
    String? StakeholderId,
    String? ComplaintsAndDisputesRegisterId,
    String? IssueDescription,
    DateTime? DateReceived,
    num? AllocatedToUserId,
    String? ClosureDetails,
    DateTime? DateClosed,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? StakeholderName,
    String? ComplaintsAndDisputesRegisterName,
    DateTime? UpdateDT,
    DateTime? CreateDT,
  }) = _ComplainsAndDisputesRegisterPayLoad;
  factory ComplainsAndDisputesRegisterPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$ComplainsAndDisputesRegisterPayLoadFromJson(json);
}
