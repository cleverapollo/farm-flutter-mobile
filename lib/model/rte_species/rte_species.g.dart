// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rte_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RteSpecies _$$_RteSpeciesFromJson(Map<String, dynamic> json) =>
    _$_RteSpecies(
      rteSpeciesId: json['RteSpeciesId'] as int?,
      speciesType: json['SpeciesType'] as String?,
      speciesTypeId: json['SpeciesTypeId'] as int?,
      commonName: json['CommonName'] as String?,
      scientificName: json['ScientificName'] as String?,
      speciesRange: json['SpeciesRange'] as String?,
      speciesRangeId: json['SpeciesRangeId'] as int?,
      campName: json['CampName'] as String?,
      campId: json['CampId'] as int?,
      dateSpotted: json['DateSpotted'] as String?,
      location: json['Location'] as String?,
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
      imagePath: json['ImagePath'] as String?,
      generalComments: json['GeneralComments'] as String?,
      photos: json['Photos'] as List<dynamic>? ?? const <PhotoModel>[],
      carRaised: json['CarRaised'] as bool? ?? false,
      carClosed: json['CarClosed'] as bool? ?? false,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RteSpeciesToJson(_$_RteSpecies instance) =>
    <String, dynamic>{
      'RteSpeciesId': instance.rteSpeciesId,
      'SpeciesType': instance.speciesType,
      'SpeciesTypeId': instance.speciesTypeId,
      'CommonName': instance.commonName,
      'ScientificName': instance.scientificName,
      'SpeciesRange': instance.speciesRange,
      'SpeciesRangeId': instance.speciesRangeId,
      'CampName': instance.campName,
      'CampId': instance.campId,
      'DateSpotted': instance.dateSpotted,
      'Location': instance.location,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'ImagePath': instance.imagePath,
      'GeneralComments': instance.generalComments,
      'Photos': instance.photos,
      'CarRaised': instance.carRaised,
      'CarClosed': instance.carClosed,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
