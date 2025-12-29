import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_signup_logout/common/bloc/auth/auth_state.dart';
import 'package:signin_signup_logout/common/bloc/auth/auth_state_cubit.dart';
import 'package:signin_signup_logout/core/config/app_theme.dart';
import 'package:signin_signup_logout/presentation/auth/pages/signin.dart';
import 'package:signin_signup_logout/presentation/auth/pages/signup.dart';
import 'package:signin_signup_logout/presentation/home/pages/home.dart';
import 'package:signin_signup_logout/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ),
  );
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return HomePage();
            }
            if (state is UnAuthenticated) {
              return SigninPage();
            }
            return SignupPage();
          },
        ),
      ),
    );
  }
}
