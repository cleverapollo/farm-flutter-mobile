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
    int? IsActive,
    int? IsMasterDataSynced,
  }) = _StakeholderPayLoad;
  factory StakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$StakeholderPayLoadFromJson(json);
}
