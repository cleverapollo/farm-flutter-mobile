// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'user_device.freezed.dart';
part 'user_device.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class UserDevice with _$UserDevice {
  const factory UserDevice({
    @JsonKey(name: 'UserDeviceId') int? userDeviceId,
    @JsonKey(name: 'DeviceId') String? deviceId,
    @JsonKey(name: 'DeviceOS') String? deviceOS,
    @JsonKey(name: 'DeviceVersion') String? deviceVersion,
    @JsonKey(name: 'AppName') String? appName,
    @JsonKey(name: 'AppVersionNumber') String? appVersionNumber,
  }) = _UserDevice;

  const UserDevice._();

  factory UserDevice.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceFromJson(json);

  @override
  Id get id => userDeviceId ?? Isar.autoIncrement;
}
