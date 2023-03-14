// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleActivity _$$_ScheduleActivityFromJson(Map<String, dynamic> json) =>
    _$_ScheduleActivity(
      scheduleActivityId: json['ScheduleActivityId'] as int?,
      scheduleActivityName: json['ScheduleActivityName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ScheduleActivityToJson(_$_ScheduleActivity instance) =>
    <String, dynamic>{
      'ScheduleActivityId': instance.scheduleActivityId,
      'ScheduleActivityName': instance.scheduleActivityName,
      'IsActive': instance.isActive,
    };
