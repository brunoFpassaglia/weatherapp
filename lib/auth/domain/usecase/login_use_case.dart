import 'package:weather_app/auth/domain/repository/auth_repository.dart';

abstract interface class LoginUseCase {
  Future<String> login(String email, String password);
  Future<void> logout();
}

class LoginUseCaseImpl implements LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<String> login(String email, String password) async {
    var token = await _authRepository.login(email, password);
    return token;
  }

  @override
  Future<void> logout() async {
    await _authRepository.logout();
  }
}
