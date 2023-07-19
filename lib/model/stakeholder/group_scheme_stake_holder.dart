// ignore_for_file: invalid_annotation_target

import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/group_scheme_stakeholder_payload/group_scheme_stakeholder_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme_stake_holder.freezed.dart';

part 'group_scheme_stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupSchemeStakeHolder with _$GroupSchemeStakeHolder {
  const factory GroupSchemeStakeHolder({
    @JsonKey(name: 'GroupSchemeStakeHolderId') String? groupSchemeStakeHolderId,
    @JsonKey(name: 'StakeholderId') String? stakeHolderId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _GroupSchemeStakeHolder;

  const GroupSchemeStakeHolder._();

  factory GroupSchemeStakeHolder.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeStakeHolderFromJson(json);

  factory GroupSchemeStakeHolder.fromGroupSchemeStakeHolderPayLoad(
      GroupSchemeStakeholderPayLoad groupSchemeStakeHolderPayLoad) {
    return GroupSchemeStakeHolder(
      stakeHolderId: groupSchemeStakeHolderPayLoad.StakeholderId,
      isMasterDataSynced: groupSchemeStakeHolderPayLoad.IsMasterDataSynced?.toInt(),
      groupSchemeId: groupSchemeStakeHolderPayLoad.GroupSchemeId?.toInt(),
      groupSchemeStakeHolderId: groupSchemeStakeHolderPayLoad.GroupSchemeStakeholderId,
    );
  }

  @override
  Id get id =>
      int.tryParse(groupSchemeStakeHolderId ?? '') ?? Isar.autoIncrement;
}
