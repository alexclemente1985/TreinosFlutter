import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup_logout/data/models/signin_req_params.dart';
import 'package:signin_signup_logout/data/models/signup_req_params.dart';
import 'package:signin_signup_logout/data/source/auth_api_service.dart';
import 'package:signin_signup_logout/data/source/auth_local_service.dart';
import 'package:signin_signup_logout/domain/repository/auth.dart';
import 'package:signin_signup_logout/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    Either result = await sl<AuthApiService>().signup(signupReq);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        // SharedPreferences sharedPreferences =
        //     await SharedPreferences.getInstance();
        //sharedPreferences.setString('token', response.data['token']);
        return Right(response);
      },
    );
  }

  @override
  Future<Either> signin(SigninReqParams signin) async {
    Either result = await sl<AuthApiService>().signin(signin);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['accessToken']);
        return Right(response);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async{
    return await sl<AuthLocalService>().isLoggedIn();
  }
}
