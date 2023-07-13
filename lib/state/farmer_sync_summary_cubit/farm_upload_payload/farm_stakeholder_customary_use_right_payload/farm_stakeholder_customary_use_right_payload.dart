import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_stakeholder_customary_use_right_payload.freezed.dart';
part 'farm_stakeholder_customary_use_right_payload.g.dart';

@freezed
class FarmStakeholderCustomaryUseRightPayLoad
    with _$FarmStakeholderCustomaryUseRightPayLoad {
  const factory FarmStakeholderCustomaryUseRightPayLoad({
    String? FarmStakeholderCustomaryUseRightId,
    String? FarmStakeholderId,
    String? CustomaryUseRightId,
    num? IsActive,
    num? IsMasterDataSynced,
  }) = _FarmStakeholderCustomaryUseRightPayLoad;
  factory FarmStakeholderCustomaryUseRightPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$FarmStakeholderCustomaryUseRightPayLoadFromJson(json);
}
