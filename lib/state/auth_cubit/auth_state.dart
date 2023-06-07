part of 'auth_cubit.dart';

class AuthState extends Union2Impl<AuthorizedAuthState, UnauthorizedAuthState> {
  factory AuthState.unauthorized() =>
      AuthState._(unions.second(const UnauthorizedAuthState()));

  factory AuthState.authorized({
    bool? haveBehaveRole,
    bool? havePerformRole,
  }) =>
      AuthState._(
        unions.first(
          AuthorizedAuthState(
            haveBehaveRole: haveBehaveRole,
            havePerformRole: havePerformRole,
          ),
        ),
      );

  AuthState._(
    super.union,
  );

  static const unions = Doublet<AuthorizedAuthState, UnauthorizedAuthState>();
}

class AuthorizedAuthState extends Equatable {
  const AuthorizedAuthState({
    this.haveBehaveRole,
    this.havePerformRole,
  });

  final bool? haveBehaveRole;
  final bool? havePerformRole;

  @override
  List<Object?> get props => [
    haveBehaveRole,
    havePerformRole,
  ];
}

class UnauthorizedAuthState extends Equatable {
  const UnauthorizedAuthState();

  @override
  List<Object?> get props => [];
}
