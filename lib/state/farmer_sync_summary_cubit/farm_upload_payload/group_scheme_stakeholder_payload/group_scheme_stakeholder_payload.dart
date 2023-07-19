import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_scheme_stakeholder_payload.g.dart';
part 'group_scheme_stakeholder_payload.freezed.dart';

@freezed
class GroupSchemeStakeholderPayLoad with _$GroupSchemeStakeholderPayLoad {
  const factory GroupSchemeStakeholderPayLoad({
    String? GroupSchemeStakeholderId,
    String? StakeholderId,
    num? GroupSchemeId,
    num? IsMasterDataSynced,
  }) = _GroupSchemeStakeholderPayLoad;
  factory GroupSchemeStakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeStakeholderPayLoadFromJson(json);

  factory GroupSchemeStakeholderPayLoad.fromGroupSchemeStakeholder(
    GroupSchemeStakeholder groupSchemeStakeholder,
  ) {
    return GroupSchemeStakeholderPayLoad(
      StakeholderId: groupSchemeStakeholder.stakeholderId,
      IsMasterDataSynced: groupSchemeStakeholder.isMasterDataSynced,
      GroupSchemeId: groupSchemeStakeholder.groupSchemeId,
      GroupSchemeStakeholderId: groupSchemeStakeholder.groupSchemeStakeholderId,
    );
  }
}
