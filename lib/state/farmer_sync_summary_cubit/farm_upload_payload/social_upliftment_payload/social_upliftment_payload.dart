import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_upliftment_payload.freezed.dart';
part 'social_upliftment_payload.g.dart';

@freezed
class SocialUpliftmentPayLoad with _$SocialUpliftmentPayLoad {
  const factory SocialUpliftmentPayLoad({
    String? SocialUpliftmentId,
    String? SocialUpliftmentName,
    int? IsActive,
    int? IsMasterDataSynced,
  }) = _SocialUpliftmentPayLoad;
  factory SocialUpliftmentPayLoad.fromJson(Map<String, dynamic> json) =>
      _$SocialUpliftmentPayLoadFromJson(json);
}
