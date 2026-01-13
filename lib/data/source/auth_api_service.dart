import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup_logout/core/network/dio_client.dart';
import 'package:signin_signup_logout/core/constants/api_urls.dart';
import 'package:signin_signup_logout/data/models/signin_req_params.dart';
import 'package:signin_signup_logout/data/models/signup_req_params.dart';
import 'package:signin_signup_logout/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> signin(SigninReqParams signinReq);
  Future<Either> getUser();
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

  @override
  Future<Either<dynamic, dynamic>> getUser() async {
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');

      // var response = await sl<DioClient>().post(
      //   ApiUrls.userProfile,
      //   options: Options(
      //     headers: {
      //       'Authorization' : 'Bearer $token'
      //     }
      //   )
      // );
      
      Map<String, dynamic> response;

      if(token != null){
        var decodeToken = JwtDecoder.decode(token!);
        response = decodeToken;

        // String role = decodeToken['role'];
        // String username = decodeToken['username'];

        return Right(response);
      }

      return Right(null);
    }
    on DioException catch(e){
      return Left(e.message);
    }
  }
}
