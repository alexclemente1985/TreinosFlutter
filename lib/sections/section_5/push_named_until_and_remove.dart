import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';

class PushNamedUntilAndRemove extends StatefulWidget{
  const PushNamedUntilAndRemove({super.key});

  @override
  State<StatefulWidget> createState() => PushNamedUntilAndRemoveState();
}

class PushNamedUntilAndRemoveState extends State<PushNamedUntilAndRemove>{
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation - PushNamedUntilAndRemove'),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text('Testing PushNamedAndRemoveUntil!'),
              ElevatedButton(
                onPressed: (){
                  // True -> permite retornar à rota anterior | False -> não permite retorno para rota anterior (bom para casos de login, para não voltar para tela de login após logado -> passar lógica no último parâmetro)
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.routePaths['push_and_pop']!, (Route<dynamic> route)=> true); 
                }, 
                child: Text("Ir para Push and Pop")
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}