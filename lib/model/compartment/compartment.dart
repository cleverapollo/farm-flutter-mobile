import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'compartment.freezed.dart';

part 'compartment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Compartment with _$Compartment {
  const factory Compartment({
    @JsonKey(name: 'CompartmentId') int? compartmentId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'ProductGroup') double? productGroup,
    @JsonKey(name: 'SpeciesGroup') double? speciesGroup,
    @JsonKey(name: 'PolygonArea') double? polygonArea,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'EffectiveArea') double? effectiveArea,
    @JsonKey(name: 'Espacement') String? espacement,
    @JsonKey(name: 'PlannedPlantDate') String? plannedPlantDate,
    @JsonKey(name: 'SurvivalPercentage') double? survivalPercentage,
    @JsonKey(name: 'StockingPercentage') double? stockingPercentage,
    @JsonKey(name: 'Rotation') String? rotation,
    @JsonKey(name: 'MAI') String? mai,
    @Default(true) @JsonKey(name: 'IsActive') bool isActive,
  }) = _Compartment;

  factory Compartment.fromJson(Map<String, dynamic> json) =>
      _$CompartmentFromJson(json);

  const Compartment._();

  @override
  Id get id => compartmentId ?? Isar.autoIncrement;
}
