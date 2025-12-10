import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_circle/ui/auth/view_models/auth_view_model.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>{

  @override
  void didChangeDependencies() {
    final authViewModel = context.watch<AuthViewModel>();

    // Faz com que seja aguardado o carregamento da tela antes de prosseguir
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(authViewModel.isLoading) return;

      if(authViewModel.isLoggedIn){
        Navigator.pushReplacementNamed(context, '/home');
      }
      else{
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB6FF02),
      body: Center(
        child: Icon(
          Icons.directions_run,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}