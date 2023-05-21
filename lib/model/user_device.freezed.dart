// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDevice _$UserDeviceFromJson(Map<String, dynamic> json) {
  return _UserDevice.fromJson(json);
}

/// @nodoc
mixin _$UserDevice {
  @JsonKey(name: 'UserDeviceId')
  int? get userDeviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeviceId')
  String? get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeviceOS')
  String? get deviceOS => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeviceVersion')
  String? get deviceVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'AppName')
  String? get appName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AppVersionNumber')
  String? get appVersionNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDeviceCopyWith<UserDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceCopyWith<$Res> {
  factory $UserDeviceCopyWith(
          UserDevice value, $Res Function(UserDevice) then) =
      _$UserDeviceCopyWithImpl<$Res, UserDevice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserDeviceId') int? userDeviceId,
      @JsonKey(name: 'DeviceId') String? deviceId,
      @JsonKey(name: 'DeviceOS') String? deviceOS,
      @JsonKey(name: 'DeviceVersion') String? deviceVersion,
      @JsonKey(name: 'AppName') String? appName,
      @JsonKey(name: 'AppVersionNumber') String? appVersionNumber});
}

/// @nodoc
class _$UserDeviceCopyWithImpl<$Res, $Val extends UserDevice>
    implements $UserDeviceCopyWith<$Res> {
  _$UserDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDeviceId = freezed,
    Object? deviceId = freezed,
    Object? deviceOS = freezed,
    Object? deviceVersion = freezed,
    Object? appName = freezed,
    Object? appVersionNumber = freezed,
  }) {
    return _then(_value.copyWith(
      userDeviceId: freezed == userDeviceId
          ? _value.userDeviceId
          : userDeviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceOS: freezed == deviceOS
          ? _value.deviceOS
          : deviceOS // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceVersion: freezed == deviceVersion
          ? _value.deviceVersion
          : deviceVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersionNumber: freezed == appVersionNumber
          ? _value.appVersionNumber
          : appVersionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDeviceCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$_UserDeviceCopyWith(
          _$_UserDevice value, $Res Function(_$_UserDevice) then) =
      __$$_UserDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserDeviceId') int? userDeviceId,
      @JsonKey(name: 'DeviceId') String? deviceId,
      @JsonKey(name: 'DeviceOS') String? deviceOS,
      @JsonKey(name: 'DeviceVersion') String? deviceVersion,
      @JsonKey(name: 'AppName') String? appName,
      @JsonKey(name: 'AppVersionNumber') String? appVersionNumber});
}

/// @nodoc
class __$$_UserDeviceCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$_UserDevice>
    implements _$$_UserDeviceCopyWith<$Res> {
  __$$_UserDeviceCopyWithImpl(
      _$_UserDevice _value, $Res Function(_$_UserDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDeviceId = freezed,
    Object? deviceId = freezed,
    Object? deviceOS = freezed,
    Object? deviceVersion = freezed,
    Object? appName = freezed,
    Object? appVersionNumber = freezed,
  }) {
    return _then(_$_UserDevice(
      userDeviceId: freezed == userDeviceId
          ? _value.userDeviceId
          : userDeviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceOS: freezed == deviceOS
          ? _value.deviceOS
          : deviceOS // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceVersion: freezed == deviceVersion
          ? _value.deviceVersion
          : deviceVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersionNumber: freezed == appVersionNumber
          ? _value.appVersionNumber
          : appVersionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDevice extends _UserDevice {
  const _$_UserDevice(
      {@JsonKey(name: 'UserDeviceId') this.userDeviceId,
      @JsonKey(name: 'DeviceId') this.deviceId,
      @JsonKey(name: 'DeviceOS') this.deviceOS,
      @JsonKey(name: 'DeviceVersion') this.deviceVersion,
      @JsonKey(name: 'AppName') this.appName,
      @JsonKey(name: 'AppVersionNumber') this.appVersionNumber})
      : super._();

  factory _$_UserDevice.fromJson(Map<String, dynamic> json) =>
      _$$_UserDeviceFromJson(json);

  @override
  @JsonKey(name: 'UserDeviceId')
  final int? userDeviceId;
  @override
  @JsonKey(name: 'DeviceId')
  final String? deviceId;
  @override
  @JsonKey(name: 'DeviceOS')
  final String? deviceOS;
  @override
  @JsonKey(name: 'DeviceVersion')
  final String? deviceVersion;
  @override
  @JsonKey(name: 'AppName')
  final String? appName;
  @override
  @JsonKey(name: 'AppVersionNumber')
  final String? appVersionNumber;

  @override
  String toString() {
    return 'UserDevice(userDeviceId: $userDeviceId, deviceId: $deviceId, deviceOS: $deviceOS, deviceVersion: $deviceVersion, appName: $appName, appVersionNumber: $appVersionNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDevice &&
            (identical(other.userDeviceId, userDeviceId) ||
                other.userDeviceId == userDeviceId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceOS, deviceOS) ||
                other.deviceOS == deviceOS) &&
            (identical(other.deviceVersion, deviceVersion) ||
                other.deviceVersion == deviceVersion) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appVersionNumber, appVersionNumber) ||
                other.appVersionNumber == appVersionNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userDeviceId, deviceId, deviceOS,
      deviceVersion, appName, appVersionNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDeviceCopyWith<_$_UserDevice> get copyWith =>
      __$$_UserDeviceCopyWithImpl<_$_UserDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDeviceToJson(
      this,
    );
  }
}

abstract class _UserDevice extends UserDevice {
  const factory _UserDevice(
          {@JsonKey(name: 'UserDeviceId') final int? userDeviceId,
          @JsonKey(name: 'DeviceId') final String? deviceId,
          @JsonKey(name: 'DeviceOS') final String? deviceOS,
          @JsonKey(name: 'DeviceVersion') final String? deviceVersion,
          @JsonKey(name: 'AppName') final String? appName,
          @JsonKey(name: 'AppVersionNumber') final String? appVersionNumber}) =
      _$_UserDevice;
  const _UserDevice._() : super._();

  factory _UserDevice.fromJson(Map<String, dynamic> json) =
      _$_UserDevice.fromJson;

  @override
  @JsonKey(name: 'UserDeviceId')
  int? get userDeviceId;
  @override
  @JsonKey(name: 'DeviceId')
  String? get deviceId;
  @override
  @JsonKey(name: 'DeviceOS')
  String? get deviceOS;
  @override
  @JsonKey(name: 'DeviceVersion')
  String? get deviceVersion;
  @override
  @JsonKey(name: 'AppName')
  String? get appName;
  @override
  @JsonKey(name: 'AppVersionNumber')
  String? get appVersionNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserDeviceCopyWith<_$_UserDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
