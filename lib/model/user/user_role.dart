// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'user_role.freezed.dart';
part 'user_role.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class UserRole with _$UserRole {
  const factory UserRole({
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'RoleName') String? roleName,
  }) = _UserRole;

  const UserRole._();

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);

  @override
  Id get id => userId ?? Isar.autoIncrement;
}
