import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';

class PushNamed extends StatefulWidget{
  const PushNamed({super.key});

  @override
  State<StatefulWidget> createState() => PushNamedState();
}

class PushNamedState extends State<PushNamed>{
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation - Push Named'),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text('Teste de navegação pushNamed!'),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['push_and_pop']!);
                }, 
                child: Text("Ir para Push and Pop")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['nav_from_child']!);}, 
                child: Text("Ir para Nav from Child")
              )
            ],
          ),
        ),
      ),
    );
  }
  
}