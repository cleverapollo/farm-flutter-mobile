// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plantation _$$_PlantationFromJson(Map<String, dynamic> json) =>
    _$_Plantation(
      plantationId: json['PlantationId'] as int?,
      plantationName: json['PlantationName'] as String?,
      isActive: json['IsActive'] as bool?,
      companyId: json['CompanyId'] as int?,
    );

Map<String, dynamic> _$$_PlantationToJson(_$_Plantation instance) =>
    <String, dynamic>{
      'PlantationId': instance.plantationId,
      'PlantationName': instance.plantationName,
      'IsActive': instance.isActive,
      'CompanyId': instance.companyId,
    };
