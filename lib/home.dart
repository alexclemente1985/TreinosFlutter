import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
import 'package:flutter_intermediate/store/global_store.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home> {
  GlobalStore _store = GlobalStore.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Text("Tela Inicial"),
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(            
            child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,AppRoutes.routePaths["section1"]!, arguments: 1);
                }, 
                child: Text("Seção 1")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,AppRoutes.routePaths["section2"]!, arguments: 1);
                }, 
                child: Text("Seção 2")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,AppRoutes.routePaths["section3"]!, arguments: 1);
                },
                child: Text("Seção 3")
              ),
              ElevatedButton(
                onPressed: (){
                   Navigator.pushNamed(context,AppRoutes.routePaths["section4"]!, arguments: 1);
                }, 
                child: Text("Seção 4")
              ),
              ElevatedButton(
               onPressed: (){
                   Navigator.pushNamed(context,AppRoutes.routePaths["section5"]!, arguments: 1);
                },
                child: Text("Seção 5")
              ),
              ElevatedButton(
                onPressed: (){
                   Navigator.pushNamed(context,AppRoutes.routePaths["section6"]!, arguments: 1);
                }, 
                child: Text("Seção 6")
              )

            ],
          ),
        ),
      )
      );
  }

}