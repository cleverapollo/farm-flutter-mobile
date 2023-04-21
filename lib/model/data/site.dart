import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Site with _$Site {

  const factory Site({
    @JsonKey(name: 'SiteId') required int siteId,
    @JsonKey(name: 'SiteName') String? siteName,
    @Default(true)
    @JsonKey(name: 'IsActive') bool isActive,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
  const Site._();

  @override
  Id get id => siteId;
}