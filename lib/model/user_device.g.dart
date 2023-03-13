// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDevice _$$_UserDeviceFromJson(Map<String, dynamic> json) =>
    _$_UserDevice(
      userId: json['UserId'] as int?,
      userDeviceId: json['UserDeviceId'] as int?,
      deviceId: json['DeviceId'] as String?,
      deviceOS: json['DeviceOS'] as String?,
      deviceVersion: json['DeviceVersion'] as String?,
      appName: json['AppName'] as String?,
      appVersionNumber: json['AppVersionNumber'] as String?,
    );

Map<String, dynamic> _$$_UserDeviceToJson(_$_UserDevice instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'UserDeviceId': instance.userDeviceId,
      'DeviceId': instance.deviceId,
      'DeviceOS': instance.deviceOS,
      'DeviceVersion': instance.deviceVersion,
      'AppName': instance.appName,
      'AppVersionNumber': instance.appVersionNumber,
    };
