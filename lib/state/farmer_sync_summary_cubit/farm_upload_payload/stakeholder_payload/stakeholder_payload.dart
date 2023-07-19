import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stakeholder_payload.freezed.dart';
part 'stakeholder_payload.g.dart';

@freezed
class StakeholderPayLoad with _$StakeholderPayLoad {
  const factory StakeholderPayLoad({
    String? StakeholderId,
    String? StakeholderName,
    String? StakeholderTypeId,
    String? Address1,
    String? Address2,
    String? ContactName,
    String? Email,
    String? Tel,
    String? Cell,
    num? IsActive,
    num? IsMasterDataSynced,
  }) = _StakeholderPayLoad;
  factory StakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$StakeholderPayLoadFromJson(json);

  factory StakeholderPayLoad.fromStakeholder(StakeHolder stakeholder) {
    return StakeholderPayLoad(
      Tel: stakeholder.tel,
      Address1: stakeholder.address1,
      Address2: stakeholder.address2,
      Cell: stakeholder.cell,
      ContactName: stakeholder.contactName,
      Email: stakeholder.email,
      IsActive: stakeholder.isActive,
      IsMasterDataSynced: stakeholder.isMasterDataSynced,
      StakeholderId: stakeholder.stakeHolderId?.toString(),
      StakeholderName: stakeholder.stakeholderName,
      StakeholderTypeId: stakeholder.stakeHolderTypeId,
    );
  }
}
