import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';

class Section5 extends StatefulWidget{
  const Section5({super.key});

  @override
  State<StatefulWidget> createState() => Section5State();
}

class Section5State extends State<Section5>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seção 5 - Navigation'),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['push_named']!);
                }, 
                child: Text('Push Named')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['push_named_until_and_remove']!);
                }, 
                child: Text('PushNamedUntilAndRemove')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['push_and_pop']!);
                }, 
                child: Text('Push and Pop')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['nav_from_child']!);
                }, 
                child: Text('Nav. from a child widget')
              )
            ],
          ),
        ),
        ),
    );
  }
  
}