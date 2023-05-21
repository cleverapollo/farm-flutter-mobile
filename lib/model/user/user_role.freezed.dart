// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRole _$UserRoleFromJson(Map<String, dynamic> json) {
  return _UserRole.fromJson(json);
}

/// @nodoc
mixin _$UserRole {
  @JsonKey(name: 'UserId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleName')
  String? get roleName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleCopyWith<UserRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleCopyWith<$Res> {
  factory $UserRoleCopyWith(UserRole value, $Res Function(UserRole) then) =
      _$UserRoleCopyWithImpl<$Res, UserRole>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'RoleName') String? roleName});
}

/// @nodoc
class _$UserRoleCopyWithImpl<$Res, $Val extends UserRole>
    implements $UserRoleCopyWith<$Res> {
  _$UserRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleName: freezed == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleCopyWith<$Res> implements $UserRoleCopyWith<$Res> {
  factory _$$_UserRoleCopyWith(
          _$_UserRole value, $Res Function(_$_UserRole) then) =
      __$$_UserRoleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'RoleName') String? roleName});
}

/// @nodoc
class __$$_UserRoleCopyWithImpl<$Res>
    extends _$UserRoleCopyWithImpl<$Res, _$_UserRole>
    implements _$$_UserRoleCopyWith<$Res> {
  __$$_UserRoleCopyWithImpl(
      _$_UserRole _value, $Res Function(_$_UserRole) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_$_UserRole(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleName: freezed == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRole extends _UserRole {
  const _$_UserRole(
      {@JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'RoleName') this.roleName})
      : super._();

  factory _$_UserRole.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final int? userId;
  @override
  @JsonKey(name: 'RoleName')
  final String? roleName;

  @override
  String toString() {
    return 'UserRole(userId: $userId, roleName: $roleName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRole &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, roleName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleCopyWith<_$_UserRole> get copyWith =>
      __$$_UserRoleCopyWithImpl<_$_UserRole>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleToJson(
      this,
    );
  }
}

abstract class _UserRole extends UserRole {
  const factory _UserRole(
      {@JsonKey(name: 'UserId') final int? userId,
      @JsonKey(name: 'RoleName') final String? roleName}) = _$_UserRole;
  const _UserRole._() : super._();

  factory _UserRole.fromJson(Map<String, dynamic> json) = _$_UserRole.fromJson;

  @override
  @JsonKey(name: 'UserId')
  int? get userId;
  @override
  @JsonKey(name: 'RoleName')
  String? get roleName;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleCopyWith<_$_UserRole> get copyWith =>
      throw _privateConstructorUsedError;
}
