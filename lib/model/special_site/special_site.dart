import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'special_site.freezed.dart';

part 'special_site.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SpecialSite with _$SpecialSite {
  const factory SpecialSite({
    @JsonKey(name: 'SpecialSiteId') String? specialSiteId,
    @JsonKey(name: 'SpecialSiteName') String? specialSiteName,
    @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _SpecialSite;

  const SpecialSite._();

  factory SpecialSite.fromJson(Map<String, dynamic> json) =>
      _$SpecialSiteFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
