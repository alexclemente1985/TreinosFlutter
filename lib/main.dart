import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_circle/ui/splash/splash_page.dart';

import 'config/dependencies.dart';
import 'config/theme_manager.dart';

import 'ui/home/widgets/home_screen.dart';
import 'ui/auth/login_screen.dart';
import 'ui/auth/view_models/auth_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providersLocal,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeManager, AuthViewModel>(
      builder: (context, themeManager, authViewModel, child) {
        return MaterialApp(
          title: "Runner's Circle",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'), // Suporte para português do Brasil
            Locale('en', 'US'), // Suporte para inglês
          ],
          theme: themeManager.lightTheme,
          darkTheme: themeManager.darkTheme,
          themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/',
          // home: authViewModel.isLoggedIn
          //     ? const HomeScreen()
          //     : const LoginScreen(),
          routes: {
            '/': (context) =>  SplashPage(),
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
