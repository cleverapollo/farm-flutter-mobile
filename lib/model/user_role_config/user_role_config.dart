import 'package:cmo/model/user_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_config.freezed.dart';

@freezed
class UserRoleResponse with _$UserRoleResponse {
  const factory UserRoleResponse({
    UserAuth? behaveUserAuth,
    UserAuth? performUserAuth,
  }) = _UserRoleResponse;
}

enum UserRoleConfig {
  behaveRole,
  performRole,
  bothRole;

  const UserRoleConfig();

  String get getAccessTokenKey {
    switch (this) {
      case UserRoleConfig.behaveRole:
        return 'behave_access_token';
      case UserRoleConfig.performRole:
        return 'perform_access_token';
      case UserRoleConfig.bothRole:
        return '';
    }
  }

  String get getRenewalTokenKey {
    switch (this) {
      case UserRoleConfig.behaveRole:
        return 'behave_renewal_token';
      case UserRoleConfig.performRole:
        return 'perform_renewal_token';
      case UserRoleConfig.bothRole:
        return '';
    }
  }

  bool get haveNoRole {
    if (!isBehave && !isPerform && !isBoth) {
      return true;
    }
    return false;
  }

  bool get isBehave {
    if (this == UserRoleConfig.behaveRole) {
      return true;
    }
    return false;
  }

  bool get isPerform {
    if (this == UserRoleConfig.behaveRole) {
      return true;
    }
    return false;
  }

  bool get isBoth {
    if (this == UserRoleConfig.behaveRole) {
      return true;
    }
    return false;
  }
}
