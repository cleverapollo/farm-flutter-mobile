// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Province _$$_ProvinceFromJson(Map<String, dynamic> json) => _$_Province(
      provinceId: json['ProvinceId'] as int?,
      provinceName: json['ProvinceName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ProvinceToJson(_$_Province instance) =>
    <String, dynamic>{
      'ProvinceId': instance.provinceId,
      'ProvinceName': instance.provinceName,
      'IsActive': instance.isActive,
    };
