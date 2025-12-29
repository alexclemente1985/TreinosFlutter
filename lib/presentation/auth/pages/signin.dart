import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state_cubit.dart';
import 'package:signin_signup_logout/common/widgets/button/basic_app_button.dart';
import 'package:signin_signup_logout/data/models/signin_req_params.dart';
import 'package:signin_signup_logout/domain/usecases/signin.dart';
import 'package:signin_signup_logout/presentation/auth/pages/signup.dart';
import 'package:signin_signup_logout/presentation/home/pages/home.dart';
import 'package:signin_signup_logout/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  TextEditingController _usernameCon = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
        },
        child: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signin(),
            const SizedBox(height: 50),
            _userNameField(),
            const SizedBox(height: 20),
            _password(),
            const SizedBox(height: 60),
            _createAccountButton(context),
            const SizedBox(height: 20),
            _signupText(context),
          ],
        ),
      ),
        ),
      )
    );
  }

  Widget _signin() {
    return const Text(
      'Sign In',
      style: TextStyle(
        color: Color(0xff2A4ECA),
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _userNameField() {
    return TextField(
      controller: _usernameCon,
      decoration: const InputDecoration(hintText: 'Username'),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: 'Login',
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              useCase: sl<SigninUseCase>(),
              params: SigninReqParams(
                password: _passwordCon.text,
                username: _usernameCon.text,
              ),
            );
          },
        );
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Don't you have account?",
            style: TextStyle(
              color: Color(0xff3B4054),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' Sign Up',
            style: const TextStyle(
              color: Color(0xff3461FD),
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
          ),
        ],
      ),
    );
  }
}
