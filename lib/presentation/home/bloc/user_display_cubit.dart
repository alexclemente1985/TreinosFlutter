import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_logout/domain/entities/user.dart';
import 'package:signin_signup_logout/domain/usecases/get_user.dart';
import 'package:signin_signup_logout/presentation/home/bloc/user_display_state.dart';
import 'package:signin_signup_logout/service_locator.dart';

class UserDisplayCubit extends Cubit<UserDisplayState>{
  UserDisplayCubit(): super(UserLoading());

  void displayUser() async{
    var result = await sl<GetUserUseCase>().call();
    result.fold(
      (error){
        emit(LoadUserFailure(errorMessage: error));
      },
      (data){
        // if (data.isNotEmpty){
          emit(UserLoaded(userEntity: data ));
        // }
        // else{

        // }
      }
    );
  }
}