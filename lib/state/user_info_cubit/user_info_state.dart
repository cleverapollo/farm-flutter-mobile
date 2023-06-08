part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  const UserInfoState({
    this.behaveUserInfo,
    this.performUserInfo,
    this.loading = false,
    this.error,
    this.isBehave = false,
    this.isFarmer = false,
    this.isRM = false,
  });

  final bool isBehave;
  final bool isRM;
  final bool isFarmer;
  final UserInfo? performUserInfo;
  final UserInfo? behaveUserInfo;
  final bool loading;
  final Object? error;

  UserInfoState copyWith({
    bool? loading,
    Object? error,
    UserInfo? performUserInfo,
    UserInfo? behaveUserInfo,
    bool? isBehave,
    bool? isRM,
    bool? isFarmer,
  }) {
    return UserInfoState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      performUserInfo: performUserInfo ?? this.performUserInfo,
      behaveUserInfo: behaveUserInfo ?? this.behaveUserInfo,
      isBehave: isBehave ?? this.isBehave,
      isRM: isRM ?? this.isRM,
      isFarmer: isFarmer ?? this.isFarmer,
    );
  }

  bool get checkRegionalManagerRoleType =>
      performUserInfo?.listRoles?.firstWhereOrNull(
        (element) => element.roleName == Constants.regionalManagerRoleName,
      ) !=
      null;

  @override
  List<Object?> get props => [
        behaveUserInfo,
        performUserInfo,
        loading,
        error,
        isFarmer,
        isRM,
        isBehave,
      ];
}

// class UserInfoState extends Union3Impl<UserInfoLoadingState, UserInfoDataState,
//     UserInfoErrorState> {
//   UserInfoState._(super.union);
//
//   factory UserInfoState.data(
//           {required UserInfo? userInfo,
//           List<UserRolePortal>? userRoles,
//           UserRoleConfig? userRole}) =>
//       UserInfoState._(unions.second(UserInfoDataState(
//           userInfo: userInfo, userRoles: userRoles, userRole: userRole)));
//
//   factory UserInfoState.error() =>
//       UserInfoState._(unions.third(const UserInfoErrorState()));
//
//   factory UserInfoState.loading() =>
//       UserInfoState._(unions.first(const UserInfoLoadingState()));
//
//   static const unions =
//       Triplet<UserInfoLoadingState, UserInfoDataState, UserInfoErrorState>();
//
//   UserInfo? get userInfo => join(
//         (p0) => null,
//         (p0) => p0.userInfo,
//         (p0) => null,
//       );
//
//   List<UserRolePortal>? get userRoles => join(
//         (p0) => null,
//         (p0) => p0.userRoles,
//         (p0) => null,
//       );
//
//   UserRoleConfig? get userRole => join(
//         (p0) => null,
//         (p0) => p0.userRole,
//         (p0) => null,
//       );
//

// }
//
// class UserInfoLoadingState extends Equatable {
//   const UserInfoLoadingState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class UserInfoErrorState extends Equatable {
//   const UserInfoErrorState();
//
//   @override
//   List<Object?> get props => [];
// }
