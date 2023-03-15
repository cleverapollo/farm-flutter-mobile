part of 'user_device_cubit.dart';

class UserDeviceState extends Union3Impl<UserDeviceLoadingState,
    UserDeviceDataState, UserDeviceErrorState> {
  UserDeviceState._(
    super.union,
  );

  factory UserDeviceState.data({required UserDevice? userDevice}) =>
      UserDeviceState._(
        unions.second(UserDeviceDataState(userDevice: userDevice)),
      );

  factory UserDeviceState.error() =>
      UserDeviceState._(unions.third(const UserDeviceErrorState()));

  factory UserDeviceState.loading() =>
      UserDeviceState._(unions.first(const UserDeviceLoadingState()));

  static const unions = Triplet<UserDeviceLoadingState, UserDeviceDataState,
      UserDeviceErrorState>();
}

class UserDeviceLoadingState extends Equatable {
  const UserDeviceLoadingState();

  @override
  List<Object?> get props => [];
}

class UserDeviceDataState extends Equatable {
  const UserDeviceDataState({
    required this.userDevice,
  });

  final UserDevice? userDevice;

  @override
  List<Object?> get props => [
        userDevice,
      ];
}

class UserDeviceErrorState extends Equatable {
  const UserDeviceErrorState();

  @override
  List<Object?> get props => [];
}
