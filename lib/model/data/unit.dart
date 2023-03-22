import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Unit with _$Unit {

  const factory Unit({
    @JsonKey(name: 'UnitId') required int  unitId,
    @JsonKey(name: 'UnitName') String? unitName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
    const Unit._();

  @override
  Id get id => unitId;
}
