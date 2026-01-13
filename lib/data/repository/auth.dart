import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup_logout/core/constants/api_urls.dart';
import 'package:signin_signup_logout/core/network/dio_client.dart';
import 'package:signin_signup_logout/data/models/signin_req_params.dart';
import 'package:signin_signup_logout/data/models/signup_req_params.dart';
import 'package:signin_signup_logout/data/models/user.dart';
import 'package:signin_signup_logout/data/source/auth_api_service.dart';
import 'package:signin_signup_logout/data/source/auth_local_service.dart';
import 'package:signin_signup_logout/domain/entities/user.dart';
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

  @override
 //Future<Either<dynamic, dynamic>> getUser() async {
   Future<Either<dynamic, dynamic>> getUser() async {
    Either result = await sl<AuthApiService>().getUser();

    return result.fold(
      (error){
        return Left(error);
      }, 
      (data){

        if(data != null && data.isNotEmpty){
          //Response response = data;
          Map<String, dynamic> response = data;
          //var userModel = UserModel.fromMap(response.data);
          var userModel = UserModel.fromMap(response);
          var userEntity = userModel.toEntity();
          return Right(userEntity);
        }
        return Right(null);
        //return Left("Sem Usuário");

      }
    );
  }
  
  @override
  Future<Either> logout() async{
   return await sl<AuthLocalService>().logout();
  }
}
