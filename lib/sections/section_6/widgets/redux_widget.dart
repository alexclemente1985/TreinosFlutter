import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_6/code/global_state.dart';

class ReduxWidget extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => ReduxWidgetState();
}

class ReduxWidgetState extends State<ReduxWidget>{
  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Store - Redux Widget Screen'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text('Teste de passing variable -> Nome: '),
              ElevatedButton(
                onPressed: (){
                  if (Navigator.of(context).canPop()){
                    Navigator.pop(context); //remove a página atual da listagem, retornando para a página abaixo na lista (caso não exista, o .canPop() vai impedir)
                  }
                  
                }, 
                child: Text("Voltar")
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}