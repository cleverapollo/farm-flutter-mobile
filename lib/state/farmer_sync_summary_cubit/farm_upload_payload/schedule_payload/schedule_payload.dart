import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_payload.freezed.dart';
part 'schedule_payload.g.dart';

@freezed
class SchedulePayLoad with _$SchedulePayLoad {
  const factory SchedulePayLoad({
    String? ScheduleId,
    int? ScheduleActivityId,
    int? GroupSchemeId,
    DateTime? Start,
    DateTime? End,
    String? FarmId,
    String? UserId,
    String? Venue,
    int? IsMasterDataSynced,
    int? IsActive,
  }) = _SchedulePayLoad;
  factory SchedulePayLoad.fromJson(Map<String, dynamic> json) =>
      _$SchedulePayLoadFromJson(json);
}
