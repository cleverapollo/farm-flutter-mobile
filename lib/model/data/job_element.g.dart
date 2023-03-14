// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobElement _$$_JobElementFromJson(Map<String, dynamic> json) =>
    _$_JobElement(
      jobElementId: json['JobElementId'] as int?,
      jobElementName: json['JobElementName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_JobElementToJson(_$_JobElement instance) =>
    <String, dynamic>{
      'JobElementId': instance.jobElementId,
      'JobElementName': instance.jobElementName,
      'IsActive': instance.isActive,
    };
