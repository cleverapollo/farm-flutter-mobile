// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      companyId: json['CompanyId'] as int?,
      companyName: json['CompanyName'] as String?,
      isActive: json['IsActive'] as bool?,
      createDT: json['CreateDT'] as String?,
      updateDT: json['UpdateDT'] as String?,
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'CompanyId': instance.companyId,
      'CompanyName': instance.companyName,
      'IsActive': instance.isActive,
      'CreateDT': instance.createDT,
      'UpdateDT': instance.updateDT,
    };
