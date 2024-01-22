abstract interface class AuthDataSource {
  Future<String> login(Map<String, dynamic> body);
  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<String> login(Map<String, dynamic> body) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return '{"access_token":"2|pretendThisIsAToken","token_type":"Bearer","user":"John Doe"}';
  }

  @override
  Future<void> logout() async {
    return;
  }
}
