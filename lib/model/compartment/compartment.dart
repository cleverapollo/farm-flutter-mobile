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
    @JsonKey(name: 'AreaTypeId') String? areaTypeId,
    @JsonKey(name: 'ProductGroupTemplateId') String? productGroupTemplateId,
    @JsonKey(name: 'ProductGroupTemplateName') String? productGroupTemplateName,
    @JsonKey(name: 'SpeciesGroupTemplateId') String? speciesGroupTemplateId,
    @JsonKey(name: 'SpeciesGroupTemplateName') String? speciesGroupTemplateName,
    @JsonKey(name: 'PolygonArea') double? polygonArea,
    @JsonKey(name: 'UnitNumber') String? unitNumber,
    @JsonKey(name: 'EffectiveArea') double? effectiveArea,
    @JsonKey(name: 'Espacement') String? espacement,
    @JsonKey(name: 'PlannedPlantDT') String? plannedPlantDT,
    @JsonKey(name: 'Survival') double? survival,
    @JsonKey(name: 'StockingPercentage') double? stockingPercentage,
    @JsonKey(name: 'RotationNumber') double? rotationNumber,
    @JsonKey(name: 'UtilMAI') double? utilMAI,
    //@ignore
    //@JsonKey(includeToJson: false, includeFromJson: false)
    @JsonKey(name: 'Locations') String? jsonLocations,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Compartment;

  const Compartment._();

  factory Compartment.fromJson(Map<String, dynamic> json) =>
      _$CompartmentFromJson(json);

  @override
  Id get id => compartmentId ?? Isar.autoIncrement;
}

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
