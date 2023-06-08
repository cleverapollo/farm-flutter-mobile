part of 'auth_cubit.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LogInAuthEvent extends AuthEvent {
  const LogInAuthEvent({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}

class LogInWithSavedCredentialsAuthEvent extends AuthEvent {
  const LogInWithSavedCredentialsAuthEvent({
    this.onSuccess,
    this.onFailure,
  });

  final void Function()? onSuccess;
  final void Function()? onFailure;

  @override
  List<Object?> get props => [
        onSuccess,
        onFailure,
      ];
}

class LogOutAuthEvent extends AuthEvent {
  const LogOutAuthEvent();

  @override
  List<Object?> get props => [];
}
