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
    @JsonKey(name: 'ActionType') String? actionTypeId,
    @JsonKey(name: 'ActionTypeDesc') String? actionTypeName,
    @JsonKey(name: 'Category') String? actionCategoryId,
    @JsonKey(name: 'CategoryDesc') String? actionCategoryName,
    @JsonKey(name: 'ActionName') String? actionName,
    @JsonKey(name: 'DateRaised') DateTime? dateRaised,
    @JsonKey(name: 'DueDate') DateTime? dueDate,
    @JsonKey(name: 'ClosingDate') DateTime? closingDate,
    @JsonKey(name: 'ClosingComment') String? closingComment,
    @JsonKey(name: 'RaisedBy') int? raisedBy,
    @JsonKey(name: 'RaisedByName') String? raisedByName,
    @JsonKey(name: 'RejectReasonId') int? rejectReasonId,
    @JsonKey(name: 'RejectReasonName') String? rejectReasonName,
    @JsonKey(name: 'ActionDesc') String? actionDescription,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'FarmName') String? farmName,
    @Default(false)
    @JsonKey(name: 'IsMajor') bool? isMajor,
    @Default(false)
    @JsonKey(name: 'IsClosed') bool? isClosed,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @ignore
    @JsonKey(name: 'Photos') List<ActionLogPhoto>? photos,
  }) = _ActionLog;

  const ActionLog._();

  factory ActionLog.fromJson(Map<String, dynamic> json) => _$ActionLogFromJson(json);

  Id get id => actionLogId ?? Isar.autoIncrement;
}
