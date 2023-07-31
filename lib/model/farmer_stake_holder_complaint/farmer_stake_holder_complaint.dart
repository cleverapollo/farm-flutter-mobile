import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farmer_stake_holder_complaint.freezed.dart';
part 'farmer_stake_holder_complaint.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmerStakeHolderComplaint with _$FarmerStakeHolderComplaint {
  const factory FarmerStakeHolderComplaint({
    @JsonKey(name: 'ComplaintsAndDisputesRegisterNo')
        String? complaintsAndDisputesRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'StakeholderId') String? stakeholderId,
    @JsonKey(name: 'ComplaintsAndDisputesRegisterId')
        String? complaintsAndDisputesRegisterId,
    @JsonKey(name: 'IssueDescription') String? issueDescription,
    @JsonKey(name: 'DateReceived') DateTime? dateReceived,
    @JsonKey(name: 'AllocatedToUserId') int? allocatedToUserId,
    @JsonKey(name: 'ClosureDetails') String? closureDetails,
    @JsonKey(name: 'DateClosed') DateTime? dateClosed,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
    @JsonKey(name: 'StakeholderName') String? stakeholderName,
    @JsonKey(name: 'ComplaintsAndDisputesRegisterName')
        String? complaintsAndDisputesRegisterName,
  }) = _FarmerStakeHolderComplaint;

  const FarmerStakeHolderComplaint._();

  factory FarmerStakeHolderComplaint.fromJson(Map<String, dynamic> json) =>
      _$FarmerStakeHolderComplaintFromJson(json);

  @override
  Id get id =>
      int.tryParse(complaintsAndDisputesRegisterNo ?? '') ?? Isar.autoIncrement;
}
