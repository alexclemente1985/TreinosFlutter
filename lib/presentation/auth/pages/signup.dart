import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state.dart';
import 'package:signin_signup_logout/common/bloc/button/button_state_cubit.dart';
import 'package:signin_signup_logout/common/widgets/button/basic_app_button.dart';
import 'package:signin_signup_logout/data/models/signup_req_params.dart';
import 'package:signin_signup_logout/domain/usecases/signup.dart';
import 'package:signin_signup_logout/presentation/auth/pages/signin.dart';
import 'package:signin_signup_logout/presentation/home/pages/home.dart';
import 'package:signin_signup_logout/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  TextEditingController _nameCon = TextEditingController();
  TextEditingController _lastNameCon = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();
  TextEditingController _usernameCon = TextEditingController();

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
                MaterialPageRoute(builder: (context) => SigninPage()),
              );
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signup(),
                  const SizedBox(height: 50),
                  _userNameField(),
                  const SizedBox(height: 20),
                  _nameField(),
                  const SizedBox(height: 20),
                  _lastNameField(),
                  const SizedBox(height: 20),
                  _password(),
                  const SizedBox(height: 60),
                  _createAccountButton(context),
                  const SizedBox(height: 20),
                  _signinText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return const Text(
      'Sign Up',
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

  Widget _nameField() {
    return TextField(
      controller: _nameCon,
      decoration: const InputDecoration(hintText: 'Name'),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(hintText: 'Last Name'),
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
          title: 'Create Account',
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              useCase: sl<SignupUseCase>(),
              params: SignupReqParams(
                name: _nameCon.text,
                lastName: _lastNameCon.text,
                password: _passwordCon.text,
                username: _usernameCon.text,
              ),
            );
            // sl<SignupUseCase>().call(
            //   param: SignupReqParams(
            //     name: _nameCon.text,
            //     lastName: _lastNameCon.text,
            //     password: _passwordCon.text,
            //     username: _usernameCon.text,
            //   ),
            // );
          },
        );
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Do you have account?',
            style: TextStyle(
              color: Color(0xff3B4054),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(
              color: Color(0xff3461FD),
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SigninPage()),
                );
              },
          ),
        ],
      ),
    );
  }
}
