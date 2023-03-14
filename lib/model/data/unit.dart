import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
class Unit with _$Unit {
  const factory Unit({
    @JsonKey(name: 'UnitId') int? unitId,
    @JsonKey(name: 'UnitName') String? unitName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
