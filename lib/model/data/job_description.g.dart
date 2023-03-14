// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobDescription _$$_JobDescriptionFromJson(Map<String, dynamic> json) =>
    _$_JobDescription(
      jobDescriptionId: json['JobDescriptionId'] as int?,
      jobDescriptionName: json['JobDescriptionName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_JobDescriptionToJson(_$_JobDescription instance) =>
    <String, dynamic>{
      'JobDescriptionId': instance.jobDescriptionId,
      'JobDescriptionName': instance.jobDescriptionName,
      'IsActive': instance.isActive,
    };
