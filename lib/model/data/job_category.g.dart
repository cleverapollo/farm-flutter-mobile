// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobCategory _$$_JobCategoryFromJson(Map<String, dynamic> json) =>
    _$_JobCategory(
      jobCategoryId: json['JobCategoryId'] as int?,
      jobCategoryName: json['JobCategoryName'] as String?,
      unitId: json['UnitId'] as int?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_JobCategoryToJson(_$_JobCategory instance) =>
    <String, dynamic>{
      'JobCategoryId': instance.jobCategoryId,
      'JobCategoryName': instance.jobCategoryName,
      'UnitId': instance.unitId,
      'IsActive': instance.isActive,
    };
