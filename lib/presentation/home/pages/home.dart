import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state_cubit.dart';
import 'package:signin_signup_logout/common/widgets/button/basic_app_button.dart';
import 'package:signin_signup_logout/domain/entities/user.dart';
import 'package:signin_signup_logout/domain/usecases/logout.dart';
import 'package:signin_signup_logout/presentation/auth/pages/signin.dart';
import 'package:signin_signup_logout/presentation/auth/pages/signup.dart';
import 'package:signin_signup_logout/presentation/home/bloc/user_display_cubit.dart';
import 'package:signin_signup_logout/presentation/home/bloc/user_display_state.dart';
import 'package:signin_signup_logout/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: MultiBlocProvider(
    //     providers: [
    //       BlocProvider(create: (context) => UserDisplayCubit()..displayUser()),
    //       BlocProvider(create: (context) => ButtonStateCubit())
    //     ], 
    //     child: BlocListener(
    //       listener: (context, state) {
    //         if(state is ButtonSuccessState){
    //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));
    //         }
    //       },
    //       child: Center(
    //         child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
    //           builder: (context, state){
    //             if(state is UserLoading){
    //               return const CircularProgressIndicator();
    //             }
    //             if(state is UserLoaded){
    //               return Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   _username(state.userEntity),
    //                   const SizedBox(height: 10,),
    //                   _role(state.userEntity),
    //                   // _logout(context)
    //                 ],
    //               );
    //             }
    //             if(state is LoadUserFailure){
    //               return Text(state.errorMessage);
    //             }
    //             return Container();
    //           }
    //         ),
    //       ),
    //     )
    //   ),
    // );

    return Scaffold(
      //body: BlocProvider(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> UserDisplayCubit()..displayUser()),
          BlocProvider(create: (context)=> ButtonStateCubit())
        ],        
        //create: (context)=> UserDisplayCubit()..displayUser(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state){
            if(state is ButtonSuccessState){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninPage()));
            }

            if(state is ButtonFailureState){
              print("Falha no state do Button:  ${state.errorMessage}");
            }
          },
          child: Center(
            child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
            builder: (context, state) {
              if(state is UserLoading){
                return const CircularProgressIndicator();
              }
              if(state is UserLoaded){

                if(state.userEntity != null){
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _username(state.userEntity),
                        const SizedBox(height: 10,),
                        _role(state.userEntity),
                        const SizedBox(height: 10,),
                        _logout(context)
                      ],
                  );
                }
                else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Usuário não logado"),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninPage()));
                        }, 
                        child: Text("Ir para login", style: TextStyle(color: Colors.white))
                      )
                    ],
                  );
                }
              }
              if(state is LoadUserFailure){
                return Text(state.errorMessage+' CARACA');
              }
              return Container();
            },),
          )
      )
      
      ),
      
    );
  }

  Widget _username(UserEntity? user) {
    return Text(
      user != null ? user.username : 'USERNAME',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

   Widget _role(UserEntity? user) {
    return Text(
      user != null ? user.role : 'USER ROLE',
       style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BasicAppButton(
        title: 'Logout',
        onPressed: (){
         context.read<ButtonStateCubit>().execute(
          useCase: sl<LogoutUseCase>()
         );
        }
      ),
    );
  }
}