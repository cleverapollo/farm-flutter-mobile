// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      userId: json['UserId'] as int?,
      userName: json['UserName'] as String?,
      userEmail: json['UserEmail'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      profileImage: json['ProfileImage'] as String?,
      isActive: json['IsActive'] as bool?,
      isReceiveUpdate: json['IsReceiveUpdate'] as bool?,
      isReceiveWelcome: json['IsReceiveWelcome'] as bool?,
      securityProviderId: json['SecurityProviderId'] as String?,
      listRoles: (json['ListRoles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roles:
          (json['Roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'UserName': instance.userName,
      'UserEmail': instance.userEmail,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'PhoneNumber': instance.phoneNumber,
      'ProfileImage': instance.profileImage,
      'IsActive': instance.isActive,
      'IsReceiveUpdate': instance.isReceiveUpdate,
      'IsReceiveWelcome': instance.isReceiveWelcome,
      'SecurityProviderId': instance.securityProviderId,
      'ListRoles': instance.listRoles,
      'Roles': instance.roles,
    };
