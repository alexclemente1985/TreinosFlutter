import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_6/code/global_state.dart';

class GlobalStateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GlobalStateWidgetState();
}

class GlobalStateWidgetState extends State<GlobalStateWidget>{

  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Store - Global State Screen'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text('Teste de global state -> Nome: ${_store.get('name')}'),
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