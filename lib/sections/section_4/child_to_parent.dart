import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/authenticator.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/custom_widget_test.dart';

class ChildToParent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ChildToParentState();
}

class ChildToParentState extends State<ChildToParent>{

  late bool _isAuthenticated;

  void _onAuthenticated(bool value){
    setState(() {
      _isAuthenticated = value;
    });
  }

  @override
  void initState() {
    _isAuthenticated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widget'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Authenticator(key: Key('auth'), onAuthenticated: _onAuthenticated),
              Text('Autenticado: ${_isAuthenticated}')
            ],
          ),
        ),
      ),
    );
  }
  
}