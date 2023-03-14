// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Municipality _$$_MunicipalityFromJson(Map<String, dynamic> json) =>
    _$_Municipality(
      municipalityId: json['MunicipalityId'] as int?,
      municipalityName: json['MunicipalityName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_MunicipalityToJson(_$_Municipality instance) =>
    <String, dynamic>{
      'MunicipalityId': instance.municipalityId,
      'MunicipalityName': instance.municipalityName,
      'IsActive': instance.isActive,
    };
