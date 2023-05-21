import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme.freezed.dart';

part 'group_scheme.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupScheme with _$GroupScheme {
  const GroupScheme._();

  @override
  Id get id => groupSchemeId ?? 0;

  const factory GroupScheme({
    @JsonKey(name: 'CreateDT') String? createDt,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'GroupSchemeManagerContactNo')
        String? groupSchemeManagerContactNo,
    @JsonKey(name: 'GroupSchemeManagerEmail') String? groupSchemeManagerEmail,
    @JsonKey(name: 'GroupSchemeManagerName') String? groupSchemeManagerName,
    @JsonKey(name: 'GroupSchemeName') String? groupSchemeName,
    @JsonKey(name: 'GroupSchemeRoleId') String? groupSchemeRoleId,
    @JsonKey(name: 'HiracId') int? hiracId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'UpdateDT') String? updateDt,
  }) = _GroupScheme;

  factory GroupScheme.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeFromJson(json);
}
