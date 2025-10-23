import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home> {
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
                  Navigator.pushNamed(context,"/section1", arguments: 1);
                }, 
                child: Text("Seção 1")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,"/section2", arguments: 1);
                }, 
                child: Text("Seção 2")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,"/section3", arguments: 1);
                },
                child: Text("Seção 3")
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text("Seção 4")
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text("Seção 5")
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text("Seção 6")
              )

            ],
          ),
        ),
      )
      );
  }

}