// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AreaType _$$_AreaTypeFromJson(Map<String, dynamic> json) => _$_AreaType(
      areaTypeId: json['AreaTypeId'] as String?,
      areaTypeName: json['AreaTypeName'] as String?,
      createDT: json['CreateDT'] as String?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      isActive: json['IsActive'] as bool?,
      totalRows: json['TotalRows'] as int?,
      updateDT: json['UpdateDT'] as String?,
    );

Map<String, dynamic> _$$_AreaTypeToJson(_$_AreaType instance) =>
    <String, dynamic>{
      'AreaTypeId': instance.areaTypeId,
      'AreaTypeName': instance.areaTypeName,
      'CreateDT': instance.createDT,
      'GroupSchemeId': instance.groupSchemeId,
      'IsActive': instance.isActive,
      'TotalRows': instance.totalRows,
      'UpdateDT': instance.updateDT,
    };
