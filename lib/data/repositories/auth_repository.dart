import 'package:runner_circle/data/storage/local_storage.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<String?> getUsername();
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<void> saveAuthState(bool isLoggedIn, String? username);
}

class MockAuthRepository implements AuthRepository {
  final LocalStorage localStorage;

  MockAuthRepository({required this.localStorage});

  final String isLoggedStorageKey = 'isLoggedKey';
  final String userNameStorageKey = 'usernameKey';

  bool _isLoggedIn = false;
  String? _username;

  @override
  Future<bool> isLoggedIn() async {
    // TODO: Implementar verificação de estado salvo
    final result = await localStorage.getData(key: isLoggedStorageKey);
    _isLoggedIn = result == 'true';

    return _isLoggedIn;
  }

  @override
  Future<String?> getUsername() async {
    // TODO: Implementar recuperação de username salvo
    final result = await localStorage.getData(key: userNameStorageKey);
    _username = result;
    return _username;
  }

  @override
  Future<bool> login(String email, String password) async {
    // Simulação de login mockado
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      _username = email.split('@').first;

      // TODO: Implementar salvamento do estado
      await saveAuthState(_isLoggedIn, _username);
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
    _username = null;

    // TODO: Implementar limpeza do estado salvo
    await saveAuthState(_isLoggedIn, _username);
  }

  @override
  Future<void> saveAuthState(bool isLoggedIn, String? username) async {
    // TODO: Implementar persistência do estado
    await localStorage.create(key: isLoggedStorageKey, data: isLoggedIn);
    await localStorage.create(key: userNameStorageKey, data: username);
    
    _isLoggedIn = isLoggedIn;
    _username = username;
  }
}
