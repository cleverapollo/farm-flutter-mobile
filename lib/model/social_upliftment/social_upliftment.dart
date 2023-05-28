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
    @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _SocialUpliftment;

  const SocialUpliftment._();

  factory SocialUpliftment.fromJson(Map<String, dynamic> json) =>
      _$SocialUpliftmentFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
