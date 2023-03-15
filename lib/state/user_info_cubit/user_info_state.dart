part of 'user_info_cubit.dart';

class UserInfoState extends Union3Impl<UserInfoLoadingState, UserInfoDataState,
    UserInfoErrorState> {
  UserInfoState._(super.union);

  factory UserInfoState.data({required UserInfo? userInfo}) =>
      UserInfoState._(unions.second(UserInfoDataState(userInfo: userInfo)));

  factory UserInfoState.error() =>
      UserInfoState._(unions.third(const UserInfoErrorState()));

  factory UserInfoState.loading() =>
      UserInfoState._(unions.first(const UserInfoLoadingState()));

  static const unions =
      Triplet<UserInfoLoadingState, UserInfoDataState, UserInfoErrorState>();
}

class UserInfoLoadingState extends Equatable {
  const UserInfoLoadingState();

  @override
  List<Object?> get props => [];
}

class UserInfoDataState extends Equatable {
  const UserInfoDataState({
    required this.userInfo,
  });

  final UserInfo? userInfo;

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
