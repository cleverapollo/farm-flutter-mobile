import 'package:cmo/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_role.g.dart';

@JsonSerializable()
class UserRole {
  @JsonKey(name: 'PortalId')
  int? portalId;
  @JsonKey(name: 'SecurityProviderPortalId')
  int? securityProviderPortalId;
  @JsonKey(name: 'PortalName')
  String? portalName;

  bool get isBehaveRole => portalName == Constants.behaveRoleName;
  bool get isPerformRole => portalName == Constants.performRoleName;

  UserRole();

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);

  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}
