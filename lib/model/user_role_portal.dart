import 'package:cmo/utils/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'user_role_portal.freezed.dart';
part 'user_role_portal.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class UserRolePortal with _$UserRolePortal {
  const factory UserRolePortal({
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'PortalId') int? portalId,
    @JsonKey(name: 'PortalName') String? portalName,
  }) = _UserRolePortal;

  const UserRolePortal._();

  factory UserRolePortal.fromJson(Map<String, dynamic> json) =>
      _$UserRolePortalFromJson(json);

  @override
  Id get id => userId ?? Isar.autoIncrement;
}

extension UserRolePortalExtension on UserRolePortal {
  bool get isBehaveRole => portalName == Constants.behaveRoleName;
  bool get isPerformRole => portalName == Constants.performRoleName;
}
