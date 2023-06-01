part of 'user_info_cubit.dart';

class UserInfoState extends Union3Impl<UserInfoLoadingState, UserInfoDataState,
    UserInfoErrorState> {
  UserInfoState._(super.union);

  factory UserInfoState.data(
          {required UserInfo? userInfo, List<UserRolePortal>? userRoles}) =>
      UserInfoState._(unions
          .second(UserInfoDataState(userInfo: userInfo, userRoles: userRoles)));

  factory UserInfoState.error() =>
      UserInfoState._(unions.third(const UserInfoErrorState()));

  factory UserInfoState.loading() =>
      UserInfoState._(unions.first(const UserInfoLoadingState()));

  static const unions =
      Triplet<UserInfoLoadingState, UserInfoDataState, UserInfoErrorState>();

  UserInfo? get userInfo => join(
        (p0) => null,
        (p0) => p0.userInfo,
        (p0) => null,
      );

  List<UserRolePortal>? get userRoles => join(
        (p0) => null,
        (p0) => p0.userRoles,
        (p0) => null,
      );

  bool get isBehave =>
      userRoles?.firstWhereOrNull((element) => element.isBehaveRole) != null;
  bool get isPerform =>
      userRoles?.firstWhereOrNull((element) => element.isPerformRole) != null;
  bool get isResourceManager =>
      userInfo?.listRoles?.firstWhereOrNull(
          (element) => element.roleName == Constants.resourceManagerRoleName) !=
      null;
}

class UserInfoLoadingState extends Equatable {
  const UserInfoLoadingState();

  @override
  List<Object?> get props => [];
}

class UserInfoDataState extends Equatable {
  const UserInfoDataState({
    required this.userInfo,
    this.userRoles,
  });

  final UserInfo? userInfo;
  final List<UserRolePortal>? userRoles;

  @override
  List<Object?> get props => [
        userInfo,
      ];
}

class UserInfoErrorState extends Equatable {
  const UserInfoErrorState();

  @override
  List<Object?> get props => [];
}
