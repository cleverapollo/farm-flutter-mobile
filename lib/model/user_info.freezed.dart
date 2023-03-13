// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: 'UserId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserEmail')
  String? get userEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileImage')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsReceiveUpdate')
  bool? get isReceiveUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsReceiveWelcome')
  bool? get isReceiveWelcome => throw _privateConstructorUsedError;
  @JsonKey(name: 'SecurityProviderId')
  String? get securityProviderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListRoles')
  List<String>? get listRoles => throw _privateConstructorUsedError;
  @JsonKey(name: 'Roles')
  List<String>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'UserName') String? userName,
      @JsonKey(name: 'UserEmail') String? userEmail,
      @JsonKey(name: 'FirstName') String? firstName,
      @JsonKey(name: 'LastName') String? lastName,
      @JsonKey(name: 'PhoneNumber') String? phoneNumber,
      @JsonKey(name: 'ProfileImage') String? profileImage,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsReceiveUpdate') bool? isReceiveUpdate,
      @JsonKey(name: 'IsReceiveWelcome') bool? isReceiveWelcome,
      @JsonKey(name: 'SecurityProviderId') String? securityProviderId,
      @JsonKey(name: 'ListRoles') List<String>? listRoles,
      @JsonKey(name: 'Roles') List<String>? roles});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? userEmail = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? profileImage = freezed,
    Object? isActive = freezed,
    Object? isReceiveUpdate = freezed,
    Object? isReceiveWelcome = freezed,
    Object? securityProviderId = freezed,
    Object? listRoles = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReceiveUpdate: freezed == isReceiveUpdate
          ? _value.isReceiveUpdate
          : isReceiveUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReceiveWelcome: freezed == isReceiveWelcome
          ? _value.isReceiveWelcome
          : isReceiveWelcome // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityProviderId: freezed == securityProviderId
          ? _value.securityProviderId
          : securityProviderId // ignore: cast_nullable_to_non_nullable
              as String?,
      listRoles: freezed == listRoles
          ? _value.listRoles
          : listRoles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'UserName') String? userName,
      @JsonKey(name: 'UserEmail') String? userEmail,
      @JsonKey(name: 'FirstName') String? firstName,
      @JsonKey(name: 'LastName') String? lastName,
      @JsonKey(name: 'PhoneNumber') String? phoneNumber,
      @JsonKey(name: 'ProfileImage') String? profileImage,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsReceiveUpdate') bool? isReceiveUpdate,
      @JsonKey(name: 'IsReceiveWelcome') bool? isReceiveWelcome,
      @JsonKey(name: 'SecurityProviderId') String? securityProviderId,
      @JsonKey(name: 'ListRoles') List<String>? listRoles,
      @JsonKey(name: 'Roles') List<String>? roles});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? userEmail = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? profileImage = freezed,
    Object? isActive = freezed,
    Object? isReceiveUpdate = freezed,
    Object? isReceiveWelcome = freezed,
    Object? securityProviderId = freezed,
    Object? listRoles = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$_UserInfo(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReceiveUpdate: freezed == isReceiveUpdate
          ? _value.isReceiveUpdate
          : isReceiveUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReceiveWelcome: freezed == isReceiveWelcome
          ? _value.isReceiveWelcome
          : isReceiveWelcome // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityProviderId: freezed == securityProviderId
          ? _value.securityProviderId
          : securityProviderId // ignore: cast_nullable_to_non_nullable
              as String?,
      listRoles: freezed == listRoles
          ? _value._listRoles
          : listRoles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {@JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'UserName') this.userName,
      @JsonKey(name: 'UserEmail') this.userEmail,
      @JsonKey(name: 'FirstName') this.firstName,
      @JsonKey(name: 'LastName') this.lastName,
      @JsonKey(name: 'PhoneNumber') this.phoneNumber,
      @JsonKey(name: 'ProfileImage') this.profileImage,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'IsReceiveUpdate') this.isReceiveUpdate,
      @JsonKey(name: 'IsReceiveWelcome') this.isReceiveWelcome,
      @JsonKey(name: 'SecurityProviderId') this.securityProviderId,
      @JsonKey(name: 'ListRoles') final List<String>? listRoles,
      @JsonKey(name: 'Roles') final List<String>? roles})
      : _listRoles = listRoles,
        _roles = roles;

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final int? userId;
  @override
  @JsonKey(name: 'UserName')
  final String? userName;
  @override
  @JsonKey(name: 'UserEmail')
  final String? userEmail;
  @override
  @JsonKey(name: 'FirstName')
  final String? firstName;
  @override
  @JsonKey(name: 'LastName')
  final String? lastName;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'ProfileImage')
  final String? profileImage;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsReceiveUpdate')
  final bool? isReceiveUpdate;
  @override
  @JsonKey(name: 'IsReceiveWelcome')
  final bool? isReceiveWelcome;
  @override
  @JsonKey(name: 'SecurityProviderId')
  final String? securityProviderId;
  final List<String>? _listRoles;
  @override
  @JsonKey(name: 'ListRoles')
  List<String>? get listRoles {
    final value = _listRoles;
    if (value == null) return null;
    if (_listRoles is EqualUnmodifiableListView) return _listRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _roles;
  @override
  @JsonKey(name: 'Roles')
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserInfo(userId: $userId, userName: $userName, userEmail: $userEmail, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, profileImage: $profileImage, isActive: $isActive, isReceiveUpdate: $isReceiveUpdate, isReceiveWelcome: $isReceiveWelcome, securityProviderId: $securityProviderId, listRoles: $listRoles, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isReceiveUpdate, isReceiveUpdate) ||
                other.isReceiveUpdate == isReceiveUpdate) &&
            (identical(other.isReceiveWelcome, isReceiveWelcome) ||
                other.isReceiveWelcome == isReceiveWelcome) &&
            (identical(other.securityProviderId, securityProviderId) ||
                other.securityProviderId == securityProviderId) &&
            const DeepCollectionEquality()
                .equals(other._listRoles, _listRoles) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      userEmail,
      firstName,
      lastName,
      phoneNumber,
      profileImage,
      isActive,
      isReceiveUpdate,
      isReceiveWelcome,
      securityProviderId,
      const DeepCollectionEquality().hash(_listRoles),
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {@JsonKey(name: 'UserId') final int? userId,
      @JsonKey(name: 'UserName') final String? userName,
      @JsonKey(name: 'UserEmail') final String? userEmail,
      @JsonKey(name: 'FirstName') final String? firstName,
      @JsonKey(name: 'LastName') final String? lastName,
      @JsonKey(name: 'PhoneNumber') final String? phoneNumber,
      @JsonKey(name: 'ProfileImage') final String? profileImage,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'IsReceiveUpdate') final bool? isReceiveUpdate,
      @JsonKey(name: 'IsReceiveWelcome') final bool? isReceiveWelcome,
      @JsonKey(name: 'SecurityProviderId') final String? securityProviderId,
      @JsonKey(name: 'ListRoles') final List<String>? listRoles,
      @JsonKey(name: 'Roles') final List<String>? roles}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

  @override
  @JsonKey(name: 'UserId')
  int? get userId;
  @override
  @JsonKey(name: 'UserName')
  String? get userName;
  @override
  @JsonKey(name: 'UserEmail')
  String? get userEmail;
  @override
  @JsonKey(name: 'FirstName')
  String? get firstName;
  @override
  @JsonKey(name: 'LastName')
  String? get lastName;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'ProfileImage')
  String? get profileImage;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsReceiveUpdate')
  bool? get isReceiveUpdate;
  @override
  @JsonKey(name: 'IsReceiveWelcome')
  bool? get isReceiveWelcome;
  @override
  @JsonKey(name: 'SecurityProviderId')
  String? get securityProviderId;
  @override
  @JsonKey(name: 'ListRoles')
  List<String>? get listRoles;
  @override
  @JsonKey(name: 'Roles')
  List<String>? get roles;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
