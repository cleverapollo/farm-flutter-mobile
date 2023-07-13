import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/complains_and_disputes_register_payload/complains_and_disputes_register_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'complaints_and_disputes_register.freezed.dart';

part 'complaints_and_disputes_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ComplaintsAndDisputesRegister with _$ComplaintsAndDisputesRegister {
  const factory ComplaintsAndDisputesRegister({
    @JsonKey(name: 'ComplaintsAndDisputesRegisterNo:')
        String? complaintsAndDisputesRegisterNo,
    @JsonKey(name: 'FarmId:') String? farmId,
    @JsonKey(name: 'StakeholderId:') String? stakeholderId,
    @JsonKey(name: 'ComplaintsAndDisputesRegisterId:')
        String? complaintsAndDisputesRegisterId,
    @JsonKey(name: 'IssueDescription:') String? issueDescription,
    @JsonKey(name: 'DateReceived:') DateTime? dateReceived,
    @JsonKey(name: 'AllocatedToUserId:') int? allocatedToUserId,
    @JsonKey(name: 'ClosureDetails:') String? closureDetails,
    @JsonKey(name: 'DateClosed:') DateTime? dateClosed,
    @JsonKey(name: 'Comment:') String? comment,
    @JsonKey(name: 'CarRaisedDate:') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate:') String? carClosedDate,
    @JsonKey(name: 'IsActive:') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced:') bool? isMasterdataSynced,
    @JsonKey(name: 'StakeholderName:') String? stakeholderName,
    @JsonKey(name: 'ComplaintsAndDisputesRegisterName:')
        String? complaintsAndDisputesRegisterName,
  }) = _ComplaintsAndDisputesRegister;

  const ComplaintsAndDisputesRegister._();

  factory ComplaintsAndDisputesRegister.fromJson(Map<String, dynamic> json) =>
      _$ComplaintsAndDisputesRegisterFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}

extension ComplaintsAndDisputesRegisterX on ComplaintsAndDisputesRegister {
  ComplainsAndDisputesRegisterPayLoad toPayLoad() {
    return ComplainsAndDisputesRegisterPayLoad(
      ComplaintsAndDisputesRegisterNo: complaintsAndDisputesRegisterNo,
      FarmId: farmId,
      StakeholderId: stakeholderId,
      ComplaintsAndDisputesRegisterId: complaintsAndDisputesRegisterId,
      IssueDescription: issueDescription,
      DateReceived: dateReceived,
      AllocatedToUserId: allocatedToUserId,
      ClosureDetails: closureDetails,
      DateClosed: dateClosed,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
      StakeholderName: stakeholderName,
      ComplaintsAndDisputesRegisterName: complaintsAndDisputesRegisterName,
    );
  }
}
