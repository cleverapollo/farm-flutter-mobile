part of 'auth_bloc.dart';

class AuthState extends Union2Impl<AuthorizedAuthState, UnauthorizedAuthState> {
  AuthState._(
    Union2<AuthorizedAuthState, UnauthorizedAuthState> union,
  ) : super(union);

  static const unions = Doublet<AuthorizedAuthState, UnauthorizedAuthState>();

  factory AuthState.authorized() => AuthState._(unions.first(const AuthorizedAuthState()));

  factory AuthState.unauthorized() => AuthState._(unions.second(const UnauthorizedAuthState()));
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
