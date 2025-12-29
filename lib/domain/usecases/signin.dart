import 'package:dartz/dartz.dart';
import 'package:signin_signup_logout/core/usecase/usecase.dart';
import 'package:signin_signup_logout/data/models/signin_req_params.dart';
import 'package:signin_signup_logout/domain/repository/auth.dart';
import 'package:signin_signup_logout/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? param}) {
    return sl<AuthRepository>().signin(param!);
  }
}