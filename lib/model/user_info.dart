// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member
import 'package:cmo/env/env.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: 'UserId') int? userId,
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
    @JsonKey(name: 'ListRoles') List<Role>? listRoles,
    @JsonKey(name: 'Roles') List<String>? roles,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

extension UserInfoX on UserInfo {
  String get fullName {
    if (firstName.isBlank && lastName.isBlank) {
      return userName ?? '';
    }

    return '${firstName ?? ''} ${lastName ?? ''}'.trim();
  }

  Future<String> get avatarUrl async {
    if (profileImage.isBlank) {
      return '';
    }

    return 'https://${Env.cmoApiUrl}$profileImage';
  }

  CharcoalPlantationRoleEnum get getCharcoalPlantationRole {
    final isCharcoal =
        listRoles.firstWhereOrNull((e) => e.roleName == 'Management Plan');
    final isPlantation = listRoles
        .firstWhereOrNull((e) => e.roleName == 'Compartment Management Plan');

    if (isCharcoal != null) {
      return CharcoalPlantationRoleEnum.isCharcoal;
    }

    if (isPlantation != null) {
      return CharcoalPlantationRoleEnum.isPlantation;
    }
    return CharcoalPlantationRoleEnum.none;
  }
}

@freezed
class Role with _$Role {
  const factory Role({
    @JsonKey(name: 'RoleId') int? roleId,
    @JsonKey(name: 'RoleName') String? roleName,
    @JsonKey(name: 'RoleDescription') String? roleDescription,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

enum CharcoalPlantationRoleEnum {
  isCharcoal,
  isPlantation,
  none,
}
