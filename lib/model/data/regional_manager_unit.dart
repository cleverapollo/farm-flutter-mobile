// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'regional_manager_unit.freezed.dart';

part 'regional_manager_unit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RegionalManagerUnit with _$RegionalManagerUnit {
  const factory RegionalManagerUnit({
    @JsonKey(name: 'RegionalManagerUnitId') required int regionalManagerUnitId,
    @JsonKey(name: 'RegionalManagerUnitName') String? regionalManagerUnitName,
    @JsonKey(name: 'GroupschemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _RegionalManagerUnit;

  const RegionalManagerUnit._();

  factory RegionalManagerUnit.fromJson(Map<String, dynamic> json) =>
      _$RegionalManagerUnitFromJson(json);

  @override
  Id get id => regionalManagerUnitId;
}
