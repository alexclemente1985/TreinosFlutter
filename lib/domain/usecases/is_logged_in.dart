import 'package:signin_signup_logout/core/usecase/usecase.dart';
import 'package:signin_signup_logout/domain/repository/auth.dart';
import 'package:signin_signup_logout/service_locator.dart';

class IsLoggedInUseCase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) {
    return sl<AuthRepository>().isLoggedIn();
  }
}
