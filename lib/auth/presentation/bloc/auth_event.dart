sealed class AuthEvent {}

class AttemptLogin extends AuthEvent {
  final String email;
  final String password;

  AttemptLogin({
    required this.email,
    required this.password,
  });
}

class LogOut extends AuthEvent {}
