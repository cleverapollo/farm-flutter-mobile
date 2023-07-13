import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_stakeholder_social_upliftment_payload.freezed.dart';
part 'farm_stakeholder_social_upliftment_payload.g.dart';

@freezed
class FarmStakeholderSocialUpliftmentPayLoad
    with _$FarmStakeholderSocialUpliftmentPayLoad {
  const factory FarmStakeholderSocialUpliftmentPayLoad({
    String? FarmStakeholderSocialUpliftmentId,
    String? FarmStakeholderId,
    String? SocialUpliftmentId,
    num? IsActive,
    num? IsMasterDataSynced,
  }) = _FarmStakeholderSocialUpliftmentPayLoad;
  factory FarmStakeholderSocialUpliftmentPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$FarmStakeholderSocialUpliftmentPayLoadFromJson(json);
}
