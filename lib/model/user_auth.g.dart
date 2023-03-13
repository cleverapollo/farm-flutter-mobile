// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAuth _$$_UserAuthFromJson(Map<String, dynamic> json) => _$_UserAuth(
      userId: json['userId'] as int?,
      displayName: json['displayName'] as String?,
      accessToken: json['accessToken'] as String?,
      renewalToken: json['renewalToken'] as String?,
    );

Map<String, dynamic> _$$_UserAuthToJson(_$_UserAuth instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'accessToken': instance.accessToken,
      'renewalToken': instance.renewalToken,
    };
