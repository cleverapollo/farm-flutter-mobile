// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      courseId: json['CourseId'] as int?,
      courseName: json['CourseName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'CourseId': instance.courseId,
      'CourseName': instance.courseName,
      'IsActive': instance.isActive,
    };
