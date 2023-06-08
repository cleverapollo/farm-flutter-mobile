part of 'auth_cubit.dart';

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
