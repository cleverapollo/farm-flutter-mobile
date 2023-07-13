import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_stakeholder_payload.freezed.dart';
part 'farm_stakeholder_payload.g.dart';

@freezed
class FarmStakeholderPayLoad with _$FarmStakeholderPayLoad {
  const factory FarmStakeholderPayLoad({
    String? FarmStakeholderId,
    String? StakeholderId,
    String? FarmId,
    num? IsMasterDataSynced,
  }) = _FarmStakeholderPayLoad;
  factory FarmStakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$FarmStakeholderPayLoadFromJson(json);
}
