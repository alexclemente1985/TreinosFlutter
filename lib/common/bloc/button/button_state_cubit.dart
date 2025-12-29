import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state.dart';
import 'package:signin_signup_logout/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void execute({dynamic params, required Usecase useCase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      Either result = await useCase.call(param: params);
      result.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
