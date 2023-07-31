import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/social_upliftment_payload/social_upliftment_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'social_upliftment.freezed.dart';
part 'social_upliftment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SocialUpliftment with _$SocialUpliftment {
  const factory SocialUpliftment({
    @JsonKey(name: 'SocialUpliftmentId') String? socialUpliftmentId,
    @JsonKey(name: 'SocialUpliftmentName') String? socialUpliftmentName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _SocialUpliftment;

  const SocialUpliftment._();

  factory SocialUpliftment.fromJson(Map<String, dynamic> json) =>
      _$SocialUpliftmentFromJson(json);

  @override
  Id get id => int.tryParse(socialUpliftmentId ?? '') ?? Isar.autoIncrement;
}

extension SocialUpliftmentX on SocialUpliftment {
  SocialUpliftmentPayLoad toPayLoad() {
    return SocialUpliftmentPayLoad(
      SocialUpliftmentId: socialUpliftmentId,
      SocialUpliftmentName: socialUpliftmentName,
      IsActive: isActive.toInt,
      IsMasterDataSynced: isMasterDataSynced,
    );
  }
}
