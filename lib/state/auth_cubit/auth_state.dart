part of 'auth_cubit.dart';

// class AuthState extends Union2Impl<AuthorizedAuthState, UnauthorizedAuthState> {
//   factory AuthState.unauthorized() =>
//       AuthState._(unions.second(const UnauthorizedAuthState()));
//
//   factory AuthState.authorized({
//     bool? haveBehaveRole,
//     bool? havePerformRole,
//     UserAuth? behaveUserAuth,
//     UserAuth? performUserAuth,
//   }) =>
//       AuthState._(
//         unions.first(
//           AuthorizedAuthState(
//             haveBehaveRole: haveBehaveRole,
//             havePerformRole: havePerformRole,
//             behaveUserAuth: behaveUserAuth,
//             performUserAuth: performUserAuth,
//           ),
//         ),
//       );
//
//   AuthState._(
//     super.union,
//   );
//
//   static const unions = Doublet<AuthorizedAuthState, UnauthorizedAuthState>();
// }

class AuthState extends Equatable {
  const AuthState({
    this.haveBehaveRole = false,
    this.havePerformRole = false,
    this.behaveUserAuth,
    this.performUserAuth,
  });

  final bool haveBehaveRole;
  final bool havePerformRole;
  final UserAuth? behaveUserAuth;
  final UserAuth? performUserAuth;

  @override
  List<Object?> get props => [
    haveBehaveRole,
    havePerformRole,
    behaveUserAuth,
    performUserAuth,
  ];

  bool get isUnauthorized => !havePerformRole && !haveBehaveRole;

  AuthState copyWith({
    bool? haveBehaveRole,
    bool? havePerformRole,
    UserAuth? behaveUserAuth,
    UserAuth? performUserAuth,
  }) {
    return AuthState(
      haveBehaveRole: haveBehaveRole ?? this.haveBehaveRole,
      havePerformRole: havePerformRole ?? this.havePerformRole,
      behaveUserAuth: behaveUserAuth ?? this.behaveUserAuth,
      performUserAuth: performUserAuth ?? this.performUserAuth,
    );
  }
}

class UnauthorizedAuthState extends Equatable {
  const UnauthorizedAuthState();

  @override
  List<Object?> get props => [];
}
