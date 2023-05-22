// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rm_schedule.freezed.dart';

part 'rm_schedule.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RMSchedule with _$RMSchedule {
  const factory RMSchedule({
    @JsonKey(name: 'ScheduleId') required String scheduleId,
    @JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'Start') String? start,
    @JsonKey(name: 'End') String? end,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'UserId') String? userId,
    @JsonKey(name: 'Venue') String? venue,
    @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _RMSchedule;

  const RMSchedule._();

  factory RMSchedule.fromJson(Map<String, dynamic> json) =>
      _$RMScheduleFromJson(json);

  @override
  Id get id => int.tryParse(scheduleId) ?? Isar.autoIncrement;
}
