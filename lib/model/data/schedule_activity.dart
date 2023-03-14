import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_activity.freezed.dart';
part 'schedule_activity.g.dart';

@freezed
class ScheduleActivity with _$ScheduleActivity {
  const factory ScheduleActivity({
    @JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
    @JsonKey(name: 'ScheduleActivityName') String? scheduleActivityName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _ScheduleActivity;

  factory ScheduleActivity.fromJson(Map<String, dynamic> json) => _$ScheduleActivityFromJson(json);
}
