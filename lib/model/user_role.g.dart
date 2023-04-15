// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRole _$UserRoleFromJson(Map<String, dynamic> json) => UserRole()
  ..portalId = json['PortalId'] as int?
  ..securityProviderPortalId = json['SecurityProviderPortalId'] as int?
  ..portalName = json['PortalName'] as String?;

Map<String, dynamic> _$UserRoleToJson(UserRole instance) => <String, dynamic>{
      'PortalId': instance.portalId,
      'SecurityProviderPortalId': instance.securityProviderPortalId,
      'PortalName': instance.portalName,
    };
