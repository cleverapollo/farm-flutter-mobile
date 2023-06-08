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
