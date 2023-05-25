import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_type.freezed.dart';
part 'area_type.g.dart';

@freezed
class AreaType with _$AreaType {
  const factory AreaType({
    @JsonKey(name: 'AreaTypeId') String? areaTypeId,
    @JsonKey(name: 'AreaTypeName') String? areaTypeName,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _AreaType;

  factory AreaType.fromJson(Map<String, dynamic> json) =>
      _$AreaTypeFromJson(json);
}
