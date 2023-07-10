import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_scheme_stakeholder_payload.g.dart';
part 'group_scheme_stakeholder_payload.freezed.dart';

@freezed
class GroupSchemeStakeholderPayLoad with _$GroupSchemeStakeholderPayLoad {
  const factory GroupSchemeStakeholderPayLoad({
    String? GroupSchemeStakeholderId,
    String? StakeholderId,
    int? GroupSchemeId,
    int? IsMasterDataSynced,
  }) = _GroupSchemeStakeholderPayLoad;
  factory GroupSchemeStakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeStakeholderPayLoadFromJson(json);
}
