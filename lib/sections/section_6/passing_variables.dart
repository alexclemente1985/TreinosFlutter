import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_6/widgets/passing_variables_widget.dart';

class PassingVariables extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PassingVariablesState();
}

class PassingVariablesState extends State<PassingVariables>{

  late TextEditingController _name;



  @override
  void initState(){
    _name = TextEditingController();
  }

  void _onPressed(BuildContext context){
      // Navigator.of(context).pushNamed(AppRoutes.routePaths['passing_variables_widget']!);

      // PassingVariablesWidget não está no roteamento original devido à necessidade de adição de parâmetro
      // Professor mantem a preferência pelo uso de global state ao invés disso
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => PassingVariablesWidget(_name.text))
      );
    }
  

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Store - Passing Variables'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text('Teste de passing variables'),
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