import 'package:flutter/material.dart';

class Tooltips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TooltipsState();
}

class TooltipsState extends State<Tooltips>{

  String _value = "Nada ainda";

  void _onPressed(){
    setState(() {
      _value = new DateTime.now().toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltip"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text(_value),
              IconButton(
                onPressed: _onPressed, 
                icon: Icon(Icons.timer),
                tooltip: "Clique aqui!"
              )
            ],
          ),
        ),
      ),
    );
  }
}