// ignore_for_file: invalid_annotation_target

import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_social_upliftment_payload/farm_stakeholder_social_upliftment_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_stakeholder_social_upliftment.freezed.dart';

part 'farm_stakeholder_social_upliftment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmStakeholderSocialUpliftment with _$FarmStakeholderSocialUpliftment {
  const factory FarmStakeholderSocialUpliftment({
    @JsonKey(name: 'FarmStakeholderSocialUpliftmentId')
        String? farmStakeholderSocialUpliftmentId,
    @JsonKey(name: 'FarmStakeholderId') String? farmStakeholderId,
    @JsonKey(name: 'SocialUpliftmentId') String? socialUpliftmentId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _FarmStakeholderSocialUpliftment;

  const FarmStakeholderSocialUpliftment._();

  factory FarmStakeholderSocialUpliftment.fromJson(Map<String, dynamic> json) =>
      _$FarmStakeholderSocialUpliftmentFromJson(json);

  @override
  Id get id =>
      int.tryParse(farmStakeholderSocialUpliftmentId ?? '') ??
      Isar.autoIncrement;
}
