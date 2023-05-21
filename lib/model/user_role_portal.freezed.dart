// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_portal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRolePortal _$UserRolePortalFromJson(Map<String, dynamic> json) {
  return _UserRolePortal.fromJson(json);
}

/// @nodoc
mixin _$UserRolePortal {
  @JsonKey(name: 'UserId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PortalId')
  int? get portalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PortalName')
  String? get portalName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRolePortalCopyWith<UserRolePortal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRolePortalCopyWith<$Res> {
  factory $UserRolePortalCopyWith(
          UserRolePortal value, $Res Function(UserRolePortal) then) =
      _$UserRolePortalCopyWithImpl<$Res, UserRolePortal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'PortalId') int? portalId,
      @JsonKey(name: 'PortalName') String? portalName});
}

/// @nodoc
class _$UserRolePortalCopyWithImpl<$Res, $Val extends UserRolePortal>
    implements $UserRolePortalCopyWith<$Res> {
  _$UserRolePortalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? portalId = freezed,
    Object? portalName = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      portalId: freezed == portalId
          ? _value.portalId
          : portalId // ignore: cast_nullable_to_non_nullable
              as int?,
      portalName: freezed == portalName
          ? _value.portalName
          : portalName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRolePortalCopyWith<$Res>
    implements $UserRolePortalCopyWith<$Res> {
  factory _$$_UserRolePortalCopyWith(
          _$_UserRolePortal value, $Res Function(_$_UserRolePortal) then) =
      __$$_UserRolePortalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'PortalId') int? portalId,
      @JsonKey(name: 'PortalName') String? portalName});
}

/// @nodoc
class __$$_UserRolePortalCopyWithImpl<$Res>
    extends _$UserRolePortalCopyWithImpl<$Res, _$_UserRolePortal>
    implements _$$_UserRolePortalCopyWith<$Res> {
  __$$_UserRolePortalCopyWithImpl(
      _$_UserRolePortal _value, $Res Function(_$_UserRolePortal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? portalId = freezed,
    Object? portalName = freezed,
  }) {
    return _then(_$_UserRolePortal(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      portalId: freezed == portalId
          ? _value.portalId
          : portalId // ignore: cast_nullable_to_non_nullable
              as int?,
      portalName: freezed == portalName
          ? _value.portalName
          : portalName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRolePortal extends _UserRolePortal {
  const _$_UserRolePortal(
      {@JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'PortalId') this.portalId,
      @JsonKey(name: 'PortalName') this.portalName})
      : super._();

  factory _$_UserRolePortal.fromJson(Map<String, dynamic> json) =>
      _$$_UserRolePortalFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final int? userId;
  @override
  @JsonKey(name: 'PortalId')
  final int? portalId;
  @override
  @JsonKey(name: 'PortalName')
  final String? portalName;

  @override
  String toString() {
    return 'UserRolePortal(userId: $userId, portalId: $portalId, portalName: $portalName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRolePortal &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.portalId, portalId) ||
                other.portalId == portalId) &&
            (identical(other.portalName, portalName) ||
                other.portalName == portalName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, portalId, portalName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRolePortalCopyWith<_$_UserRolePortal> get copyWith =>
      __$$_UserRolePortalCopyWithImpl<_$_UserRolePortal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRolePortalToJson(
      this,
    );
  }
}

abstract class _UserRolePortal extends UserRolePortal {
  const factory _UserRolePortal(
          {@JsonKey(name: 'UserId') final int? userId,
          @JsonKey(name: 'PortalId') final int? portalId,
          @JsonKey(name: 'PortalName') final String? portalName}) =
      _$_UserRolePortal;
  const _UserRolePortal._() : super._();

  factory _UserRolePortal.fromJson(Map<String, dynamic> json) =
      _$_UserRolePortal.fromJson;

  @override
  @JsonKey(name: 'UserId')
  int? get userId;
  @override
  @JsonKey(name: 'PortalId')
  int? get portalId;
  @override
  @JsonKey(name: 'PortalName')
  String? get portalName;
  @override
  @JsonKey(ignore: true)
  _$$_UserRolePortalCopyWith<_$_UserRolePortal> get copyWith =>
      throw _privateConstructorUsedError;
}
