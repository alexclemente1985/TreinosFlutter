import 'package:cinetopia/ui/components/buttons.dart';
import 'package:cinetopia/ui/screens/search_movies.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink( //Container irá fazer com que o componente Ink do InkWell suma da tela por estar abaixo do Container
        decoration: BoxDecoration(
          gradient: LinearGradient( //Permite a criação de degradê
            colors: <Color> [
              Color(0xFF000000),
              Color(0xFF1D0E44)
            ], begin: Alignment.topCenter
          )
        ),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, //para descolar do topo, fazendo o widget ter o tamanho mínimo o possível
            children: [
              Image.asset("assets/logo.png"),
              Image.asset("assets/splash.png"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              PrimaryButton(
                text: "Quero começar!",
                icon: Icons.arrow_forward,
                onTap: (){
                  print("COMEÇAR !!!!");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchMovies()));
                },)
            ]
          ),
        )
       ),
      )
      );
  }
}