import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

// part 'compartment.freezed.dart';

part 'compartment.g.dart';

//@freezed
@Collection(ignore: {'copyWith'})
class Compartment {
  @JsonKey(name: 'CompartmentId')
  int? compartmentId;
  @JsonKey(name: 'CompartmentName')
  String? compartmentName;
  @JsonKey(name: 'ProductGroupId')
  int? productGroupId;
  @JsonKey(name: 'ProductGroupName')
  String? productGroupName;
  @JsonKey(name: 'SpeciesGroupId')
  int? speciesGroupId;
  @JsonKey(name: 'SpeciesGroupName')
  String? speciesGroupName;
  @JsonKey(name: 'PolygonArea')
  double? polygonArea;
  @JsonKey(name: 'Unit')
  String? unit;
  @JsonKey(name: 'EffectiveArea')
  double? effectiveArea;
  @JsonKey(name: 'Espacement')
  String? espacement;
  @JsonKey(name: 'PlannedPlantDate')
  String? plannedPlantDate;
  @JsonKey(name: 'SurvivalPercentage')
  double? survivalPercentage;
  @JsonKey(name: 'StockingPercentage')
  double? stockingPercentage;
  @JsonKey(name: 'Rotation')
  String? rotation;
  @JsonKey(name: 'MAI')
  String? mai;
  @JsonKey(name: 'Locations')
  List<GeoLocation>? locations;
  @JsonKey(name: 'IsActive')
  bool? isActive;

  // // factory Compartment.fromJson(Map<String, dynamic> json) =>
  // //     _$CompartmentFromJson(json);
  //
  Compartment({
    int? compartmentId,
    String? compartmentName,
    int? productGroupId,
    String? productGroupName,
    int? speciesGroupId,
    String? speciesGroupName,
    double? polygonArea,
    String? unit,
    double? effectiveArea,
    String? espacement,
    String? plannedPlantDate,
    double? survivalPercentage,
    double? stockingPercentage,
    String? rotation,
    String? mai,
    List<GeoLocation>? locations,
    bool? isActive,
  });

  @override
  Id get id => compartmentId ?? Isar.autoIncrement;
}

@embedded
class GeoLocation {
  GeoLocation({this.latitude, this.longitude});

  double? latitude;
  double? longitude;
}
