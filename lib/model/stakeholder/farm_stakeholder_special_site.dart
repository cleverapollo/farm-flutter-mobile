// ignore_for_file: invalid_annotation_target

import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_special_site_payload/farm_stakeholder_special_site_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_stakeholder_special_site.freezed.dart';

part 'farm_stakeholder_special_site.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmStakeholderSpecialSite with _$FarmStakeholderSpecialSite {
  const factory FarmStakeholderSpecialSite({
    @JsonKey(name: 'FarmStakeholderSpecialSiteId')
        String? farmStakeholderSpecialSiteId,
    @JsonKey(name: 'FarmStakeholderId') String? farmStakeholderId,
    @JsonKey(name: 'SpecialSiteId') String? specialSiteId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _FarmStakeholderSpecialSite;

  const FarmStakeholderSpecialSite._();

  factory FarmStakeholderSpecialSite.fromJson(Map<String, dynamic> json) =>
      _$FarmStakeholderSpecialSiteFromJson(json);

  @override
  Id get id =>
      int.tryParse(farmStakeholderSpecialSiteId ?? '') ?? Isar.autoIncrement;
}