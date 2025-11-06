import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
import 'package:flutter_intermediate/sections/section_6/code/global_state.dart';

class GlobalStateScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GlobalStateScreenState();
}

class GlobalStateScreenState extends State<GlobalStateScreen>{

  late TextEditingController _name;
  GlobalState _store = GlobalState.instance;



  @override
  void initState(){
    _name = TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
  }

  void _onPressed(BuildContext context){
      _store.set('name', _name.text);
      Navigator.of(context).pushNamed(AppRoutes.routePaths['global_state_widget']!);
    }
  

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Store - Global State'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text('Teste de global state'),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: 'Informe o seu nome:'
                ),
              ),
              ElevatedButton(
                onPressed: () => _onPressed(context), 
                child: Text("Ir para tela de verificação!")
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}