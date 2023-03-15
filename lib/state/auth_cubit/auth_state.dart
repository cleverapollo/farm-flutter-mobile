part of 'auth_cubit.dart';

class AuthState extends Union2Impl<AuthorizedAuthState, UnauthorizedAuthState> {

  factory AuthState.unauthorized() => AuthState._(unions.second(const UnauthorizedAuthState()));

  factory AuthState.authorized() => AuthState._(unions.first(const AuthorizedAuthState()));
  AuthState._(
    super.union,
  );

  static const unions = Doublet<AuthorizedAuthState, UnauthorizedAuthState>();
}

class AuthorizedAuthState extends Equatable {
  const AuthorizedAuthState();

  @override
  List<Object?> get props => [];
}

class UnauthorizedAuthState extends Equatable {
  const UnauthorizedAuthState();

  @override
  List<Object?> get props => [];
}
