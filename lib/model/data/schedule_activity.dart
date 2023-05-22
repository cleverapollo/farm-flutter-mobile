// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'schedule_activity.freezed.dart';

part 'schedule_activity.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ScheduleActivity with _$ScheduleActivity {
  const factory ScheduleActivity({
    @JsonKey(name: 'ScheduleActivityId') required int scheduleActivityId,
    @JsonKey(name: 'ScheduleActivityName') String? scheduleActivityName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _ScheduleActivity;

  factory ScheduleActivity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleActivityFromJson(json);

  const ScheduleActivity._();

  @override
  Id get id => scheduleActivityId;
}
