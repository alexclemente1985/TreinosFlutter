import 'dart:io' show Platform;

class ApiUrls {
  static var baseURL =
      'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/';
  static var register = '${baseURL}auth/signup';
  static var signin = '${baseURL}auth/signin';
}
