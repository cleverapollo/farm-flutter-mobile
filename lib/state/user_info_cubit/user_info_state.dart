part of 'user_info_cubit.dart';

class UserInfoState extends Union3Impl<UserInfoLoadingState, UserInfoDataState, UserInfoErrorState> {
  UserInfoState._(
    Union3<UserInfoLoadingState, UserInfoDataState, UserInfoErrorState> union,
  ) : super(union);

  static const unions = Triplet<UserInfoLoadingState, UserInfoDataState, UserInfoErrorState>();

  factory UserInfoState.loading() => UserInfoState._(unions.first(const UserInfoLoadingState()));

  factory UserInfoState.data() => UserInfoState._(unions.second(const UserInfoDataState()));

  factory UserInfoState.error() => UserInfoState._(unions.third(const UserInfoErrorState()));
}

class UserInfoLoadingState extends Equatable {
  const UserInfoLoadingState();

  @override
  List<Object?> get props => [];
}

class UserInfoDataState extends Equatable {
  const UserInfoDataState();

  @override
  List<Object?> get props => [];
}

class UserInfoErrorState extends Equatable {
  const UserInfoErrorState();

  @override
  List<Object?> get props => [];
}
