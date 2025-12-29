import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:signin_signup_logout/core/network/dio_client.dart';
import 'package:signin_signup_logout/core/constants/api_urls.dart';
import 'package:signin_signup_logout/data/models/signin_req_params.dart';
import 'package:signin_signup_logout/data/models/signup_req_params.dart';
import 'package:signin_signup_logout/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> signin(SigninReqParams signinReq);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signupReq.toMap(),
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> signin(SigninReqParams signin) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.signin,
        data: signin.toMap(),
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }
}
