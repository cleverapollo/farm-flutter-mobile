import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_type.freezed.dart';
part 'action_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionType with _$ActionType {
  const factory ActionType({
    @JsonKey(name: 'ActionLogTypeId') int? actionLogTypeId,
    @JsonKey(name: 'ActionLogTypeName') String? actionLogTypeName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _ActionType;

  const ActionType._();

  factory ActionType.fromJson(Map<String, dynamic> json) => _$ActionTypeFromJson(json);

  Id get id => actionLogTypeId ?? Isar.autoIncrement;
}