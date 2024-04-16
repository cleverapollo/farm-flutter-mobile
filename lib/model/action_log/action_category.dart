import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_category.freezed.dart';
part 'action_category.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionCategory with _$ActionCategory {
  const factory ActionCategory({
    @JsonKey(name: 'LocalId') int? localId,
    @JsonKey(name: 'Value') String? actionCategoryId,
    @JsonKey(name: 'Text') String? actionCategoryName,
  }) = _ActionCategory;

  const ActionCategory._();

  factory ActionCategory.fromJson(Map<String, dynamic> json) => _$ActionCategoryFromJson(json);

  Id get id => localId ?? Isar.autoIncrement;
}
