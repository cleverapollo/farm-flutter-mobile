import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_type.freezed.dart';
part 'action_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionType with _$ActionType {
  const factory ActionType({
    @JsonKey(name: 'LocalId') int? localId,
    @JsonKey(name: 'Value') String? actionTypeId,
    @JsonKey(name: 'Text') String? actionTypeName,
  }) = _ActionType;

  const ActionType._();

  factory ActionType.fromJson(Map<String, dynamic> json) => _$ActionTypeFromJson(json);

  Id get id => localId ?? Isar.autoIncrement;
}
