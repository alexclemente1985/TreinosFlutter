import 'package:get_it/get_it.dart';
import 'package:signin_signup_logout/core/network/dio_client.dart';
import 'package:signin_signup_logout/data/repository/auth.dart';
import 'package:signin_signup_logout/data/source/auth_api_service.dart';
import 'package:signin_signup_logout/data/source/auth_local_service.dart';
import 'package:signin_signup_logout/domain/repository/auth.dart';
import 'package:signin_signup_logout/domain/usecases/is_logged_in.dart';
import 'package:signin_signup_logout/domain/usecases/signin.dart';
import 'package:signin_signup_logout/domain/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
}
