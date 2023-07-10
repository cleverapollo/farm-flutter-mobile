import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_stakeholder_special_site_payload.freezed.dart';
part 'farm_stakeholder_special_site_payload.g.dart';

@freezed
class FarmStakeholderSpecialSitePayLoad
    with _$FarmStakeholderSpecialSitePayLoad {
  const factory FarmStakeholderSpecialSitePayLoad({
    String? FarmStakeholderSpecialSiteId,
    String? FarmStakeholderId,
    String? SpecialSiteId,
    int? IsActive,
    int? IsMasterDataSynced,
  }) = _FarmStakeholderSpecialSitePayLoad;
  factory FarmStakeholderSpecialSitePayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$FarmStakeholderSpecialSitePayLoadFromJson(json);
}
