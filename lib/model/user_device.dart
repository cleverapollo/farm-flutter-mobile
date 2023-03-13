import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device.freezed.dart';
part 'user_device.g.dart';

@freezed
class UserDevice with _$UserDevice {
  const factory UserDevice({
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'UserDeviceId') int? userDeviceId,
    @JsonKey(name: 'DeviceId') String? deviceId,
    @JsonKey(name: 'DeviceOS') String? deviceOS,
    @JsonKey(name: 'DeviceVersion') String? deviceVersion,
    @JsonKey(name: 'AppName') String? appName,
    @JsonKey(name: 'AppVersionNumber') String? appVersionNumber,
  }) = _UserDevice;

  factory UserDevice.fromJson(Map<String, dynamic> json) => _$UserDeviceFromJson(json);
}
