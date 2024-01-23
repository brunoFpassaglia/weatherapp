sealed class AuthState {}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String jwtToken;

  AuthAuthenticated(this.jwtToken);
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}
