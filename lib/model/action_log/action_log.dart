import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_log.freezed.dart';
part 'action_log.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionLog with _$ActionLog {
  const factory ActionLog({
    @JsonKey(name: 'ActionLogId') String? actionLogId,
    @JsonKey(name: 'ActionLogNo') String? actionLogNo,
    @JsonKey(name: 'ActionName') String? actionName,
    @JsonKey(name: 'TypeId') int? typeId,
    @JsonKey(name: 'CategoryId') int? categoryId,
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'Members') List<String>? members,
    @JsonKey(name: 'ReasonId') int? reasonId,
    @JsonKey(name: 'DateRaised') DateTime? dateRaised,
    @JsonKey(name: 'DueDate') DateTime? dueDate,
    @JsonKey(name: 'Action') String? action,
    @Default(false)
    @JsonKey(name: 'IsMajor') bool? isMajor,
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

  Id get id => int.tryParse(actionLogNo ?? '') ?? Isar.autoIncrement;
}
