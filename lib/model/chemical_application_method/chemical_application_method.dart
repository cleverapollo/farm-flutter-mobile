import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'chemical_application_method.freezed.dart';

part 'chemical_application_method.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ChemicalApplicationMethod with _$ChemicalApplicationMethod {
  const factory ChemicalApplicationMethod({
    @JsonKey(name: 'ChemicalApplicationMethodId')
        int? chemicalApplicationMethodId,
    @JsonKey(name: 'ChemicalApplicationMethodName')
        String? hemicalApplicationMethodName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeI,
  }) = _ChemicalApplicationMethod;

  const ChemicalApplicationMethod._();

  factory ChemicalApplicationMethod.fromJson(Map<String, dynamic> json) =>
      _$ChemicalApplicationMethodFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
