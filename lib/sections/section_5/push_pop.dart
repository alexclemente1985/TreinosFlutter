import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';

class PushPop extends StatefulWidget{
  const PushPop({super.key});

  @override
  State<StatefulWidget> createState() => PushPopState();
}

class PushPopState extends State<PushPop>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation - Push and Pop'),
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
                  if (Navigator.of(context).canPop()){
                    Navigator.pop(context); //remove a página atual da listagem, retornando para a página abaixo na lista (caso não exista, o .canPop() vai impedir)
                  }
                  
                }, 
                child: Text("Pop!")
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}