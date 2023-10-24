// ignore_for_file: invalid_annotation_target

import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/stakeholder_payload/stakeholder_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'stake_holder.freezed.dart';
part 'stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class StakeHolder with _$StakeHolder {
  const factory StakeHolder({
    @JsonKey(name: 'StakeholderId') String? stakeHolderId,
    @JsonKey(name: 'StakeholderName') String? stakeholderName,
    @JsonKey(name: 'StakeholderTypeId') String? stakeHolderTypeId,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Address1') String? address1,
    @JsonKey(name: 'Address2') String? address2,
    @JsonKey(name: 'Tel') String? tel,
    @JsonKey(name: 'Cell') String? cell,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @Default(1) @JsonKey(name: 'IsActive') int? isActive,
    @Default(0) @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _StakeHolder;

  factory StakeHolder.fromStakeholderPayLoad(
      StakeholderPayLoad stakeholderPayLoad) {
    return StakeHolder(
      isMasterDataSynced: stakeholderPayLoad.IsMasterDataSynced?.toInt(),
      isActive: stakeholderPayLoad.IsActive?.toInt(),
      address1: stakeholderPayLoad.Address1,
      address2: stakeholderPayLoad.Address2,
      cell: stakeholderPayLoad.Cell,
      contactName: stakeholderPayLoad.ContactName,
      email: stakeholderPayLoad.Email,
      stakeHolderId: stakeholderPayLoad.StakeholderId,
      stakeholderName: stakeholderPayLoad.StakeholderName,
      stakeHolderTypeId: stakeholderPayLoad.StakeholderTypeId,
      tel: stakeholderPayLoad.Tel,
      createDT: stakeholderPayLoad.CreateDT,
      updateDT: stakeholderPayLoad.UpdateDT,
    );
  }

  const StakeHolder._();

  factory StakeHolder.fromJson(Map<String, dynamic> json) =>
      _$StakeHolderFromJson(json);

  @override
  Id get id => int.tryParse(stakeHolderId ?? '') ?? Isar.autoIncrement;
}

extension StakeHolderX on StakeHolder {
  StakeholderPayLoad toPayLoad() {
    return StakeholderPayLoad(
      StakeholderId: stakeHolderId.toString(),
      StakeholderName: stakeholderName,
      StakeholderTypeId: stakeHolderTypeId,
      Address1: address1,
      Address2: address2,
      ContactName: contactName,
      Email: email,
      Tel: tel,
      Cell: cell,
      IsActive: isActive,
      IsMasterDataSynced: isMasterDataSynced,
      CreateDT: createDT,
      UpdateDT: updateDT,
    );
  }
}
