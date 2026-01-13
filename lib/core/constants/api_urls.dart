import 'dart:io' show Platform;

class ApiUrls {
  static var baseURL =
      // 'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/'; // Para o caso de desenvolvimento com emulador
      'http://${Platform.isAndroid ? '192.168.0.71' : 'localhost'}:3000/'; //Para o caso de desenvolvimento com dispositivo; verificar IP da máquina com server, na mesma rede do dispositivo
  static var register = '${baseURL}auth/signup';
  static var signin = '${baseURL}auth/signin';
  // static var userProfile = '${baseURL}users/profile';
}
