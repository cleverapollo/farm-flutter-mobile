import 'package:freezed_annotation/freezed_annotation.dart';

part 'special_site_payload.freezed.dart';
part 'special_site_payload.g.dart';

@freezed
class SpecialSitePayLoad with _$SpecialSitePayLoad {
  const factory SpecialSitePayLoad({
    String? SpecialSiteId,
    String? SpecialSiteName,
    int? IsActive,
    int? IsMasterDataSynced,
  }) = _SpecialSitePayLoad;
  factory SpecialSitePayLoad.fromJson(Map<String, dynamic> json) =>
      _$SpecialSitePayLoadFromJson(json);
}
