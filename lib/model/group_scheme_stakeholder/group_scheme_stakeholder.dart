import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/group_scheme_stakeholder_payload/group_scheme_stakeholder_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme_stakeholder.freezed.dart';
part 'group_scheme_stakeholder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupSchemeStakeholder with _$GroupSchemeStakeholder {
  const factory GroupSchemeStakeholder({
    @JsonKey(name: 'GroupSchemeStakeholderId') String? groupSchemeStakeholderId,
    @JsonKey(name: 'StakeholderId') String? stakeholderId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @Default(0) @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _GroupSchemeStakeholder;

  const GroupSchemeStakeholder._();

  factory GroupSchemeStakeholder.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeStakeholderFromJson(json);

  @override
  Id get id => int.tryParse(groupSchemeStakeholderId ?? '') ?? Isar.autoIncrement;

  factory GroupSchemeStakeholder.fromGroupSchemeStakeholderPayLoad(
      GroupSchemeStakeholderPayLoad groupSchemeStakeHolderPayLoad) {
    return GroupSchemeStakeholder(
      stakeholderId: groupSchemeStakeHolderPayLoad.StakeholderId,
      isMasterDataSynced: groupSchemeStakeHolderPayLoad.IsMasterDataSynced?.toInt(),
      groupSchemeId: groupSchemeStakeHolderPayLoad.GroupSchemeId?.toInt(),
      groupSchemeStakeholderId: groupSchemeStakeHolderPayLoad.GroupSchemeStakeholderId,
    );
  }
}
