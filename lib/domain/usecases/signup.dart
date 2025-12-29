import 'package:dartz/dartz.dart';
import 'package:signin_signup_logout/core/usecase/usecase.dart';
import 'package:signin_signup_logout/data/models/signup_req_params.dart';
import 'package:signin_signup_logout/domain/repository/auth.dart';
import 'package:signin_signup_logout/service_locator.dart';

class SignupUseCase implements Usecase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? param}) {
    return sl<AuthRepository>().signup(param!);
  }
}
