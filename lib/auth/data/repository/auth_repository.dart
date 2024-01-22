import 'dart:convert';

import 'package:weather_app/auth/data/datasource/auth_datasource.dart';
import 'package:weather_app/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<String> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };
    var response = await _dataSource.login(body);
    var token = json.decode(response)['access_token'];
    return token;
  }

  @override
  Future<void> logout() async {
    return await _dataSource.logout();
  }
}
