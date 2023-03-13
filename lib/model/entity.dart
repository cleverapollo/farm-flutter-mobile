import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class Entity with _$Entity {
  const factory Entity({
    required String name,
    required EntityType type,
  }) = _Entity;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

enum EntityType { gs, rmu, cpy }
