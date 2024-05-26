import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_log.freezed.dart';
part 'action_log.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionLog with _$ActionLog {
  const factory ActionLog({
    @JsonKey(name: 'Id') int? actionLogId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'ActionLogTypeId') int? actionTypeId,
    @JsonKey(name: 'ActionLogTypeName') String? actionTypeName,
    @JsonKey(name: 'ActionName') String? actionName,
    @JsonKey(name: 'RaisedBy') int? raisedBy,
    @JsonKey(name: 'RaisedByName') String? raisedByName,
    @JsonKey(name: 'DateRaised') DateTime? dateRaised,
    @JsonKey(name: 'DueDate') DateTime? dueDate,
    @JsonKey(name: 'ClosingDate') DateTime? closingDate,
    @JsonKey(name: 'ClosingComment') String? closingComment,
    @JsonKey(name: 'RejectReasonId') int? rejectReasonId,
    @JsonKey(name: 'RejectReasonName') String? rejectReasonName,
    @JsonKey(name: 'NcAction') String? ncAction,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @Default(false)
    @JsonKey(name: 'IsMajor') bool? isMajor,
    @Default(false)
    @JsonKey(name: 'IsClosed') bool? isClosed,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterDataSynced') bool isMasterDataSynced,
    @ignore
    @JsonKey(name: 'Photos') List<ActionLogPhoto>? photos,
  }) = _ActionLog;

  const ActionLog._();

  factory ActionLog.fromJson(Map<String, dynamic> json) => _$ActionLogFromJson(json);

  Id get id => actionLogId ?? Isar.autoIncrement;
}

extension ActionLogExtension on ActionLog {
  UpcomingTabStatus? get upcomingTabStatus {
    if (dueDate == null) return null;
    if (DateTime.now().isSameDate(dueDate)) {
      return UpcomingTabStatus.due;
    } else if (DateTime.now().isAfter(dueDate!)) {
      return UpcomingTabStatus.overdue;
    } else if (DateTime.now().isBefore(dueDate!)) {
      return UpcomingTabStatus.upcoming;
    }

    return null;
  }
}
