import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'compartment.freezed.dart';
part 'compartment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Compartment with _$Compartment {
  const factory Compartment({
  @JsonKey(name: 'CompartmentId')
  int? compartmentId,
  @JsonKey(name: 'CompartmentName')
  String? compartmentName,
  @JsonKey(name: 'ProductGroupId')
  int? productGroupId,
  @JsonKey(name: 'ProductGroupName')
  String? productGroupName,
  @JsonKey(name: 'SpeciesGroupId')
  int? speciesGroupId,
  @JsonKey(name: 'SpeciesGroupName')
  String? speciesGroupName,
  @JsonKey(name: 'PolygonArea')
  double? polygonArea,
  @JsonKey(name: 'Unit')
  String? unit,
  @JsonKey(name: 'EffectiveArea')
  double? effectiveArea,
  @JsonKey(name: 'Espacement')
  String? espacement,
  @JsonKey(name: 'PlannedPlantDate')
  String? plannedPlantDate,
  @JsonKey(name: 'SurvivalPercentage')
  double? survivalPercentage,
  @JsonKey(name: 'StockingPercentage')
  double? stockingPercentage,
  @JsonKey(name: 'Rotation')
  String? rotation,
  @JsonKey(name: 'MAI')
  String? mai,
  //@ignore
  //@JsonKey(includeToJson: false, includeFromJson: false)
  @JsonKey(name: 'Locations')
  String? jsonLocations,
  @JsonKey(name: 'IsActive')
  bool? isActive,
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
    @JsonKey(name: 'Latitude')
    double? latitude,
    @JsonKey(name: 'Longitude')
    double? longitude,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
