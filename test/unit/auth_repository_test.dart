import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/auth/data/datasource/auth_datasource.dart';
import 'package:weather_app/auth/data/repository/auth_repository.dart';
import 'package:weather_app/auth/domain/repository/auth_repository.dart';

void main() {
  late AuthRepository authRepo;
  late AuthDataSource authDataSource;
  setUp(() {
    authDataSource = AuthDataSourceImpl();
    authRepo = AuthRepositoryImpl(dataSource: authDataSource);
  });
  test('test repository can deserialize response into a token', () async {
    final token = await authRepo.login('email', 'password');
    expect(token, '2|pretendThisIsAToken');
  });
}
