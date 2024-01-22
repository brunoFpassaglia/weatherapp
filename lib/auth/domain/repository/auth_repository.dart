abstract interface class AuthRepository {
  Future<String> login(String email, String password);
  Future<void> logout();
}
