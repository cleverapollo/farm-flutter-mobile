import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'chemical_type.freezed.dart';

part 'chemical_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ChemicalType with _$ChemicalType {
  const factory ChemicalType({
    @JsonKey(name: 'ChemicalTypeId') int? chemicalTypeId,
    @JsonKey(name: 'ChemicalTypeName') String? chemicalTypeName,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _ChemicalType;

  const ChemicalType._();

  factory ChemicalType.fromJson(Map<String, dynamic> json) =>
      _$ChemicalTypeFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
