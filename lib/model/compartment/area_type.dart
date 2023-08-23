import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'area_type.freezed.dart';
part 'area_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AreaType with _$AreaType {
  const factory AreaType({
    @JsonKey(name: 'LocalId') int? localId,
    @JsonKey(name: 'AreaTypeId') String? areaTypeId,
    @JsonKey(name: 'AreaTypeName') String? areaTypeName,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _AreaType;

  const AreaType._();

  factory AreaType.fromJson(Map<String, dynamic> json) =>
      _$AreaTypeFromJson(json);

  @override
  Id get id => localId ?? Isar.autoIncrement;
}
