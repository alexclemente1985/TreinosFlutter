import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatefulWidgetComponent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StatefulWidgetState();
}

class StatefulWidgetState extends State<StatefulWidgetComponent>{
  String _value = 'Isto é um teste de state';
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer){
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState(() => _value = formatted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text("Que horas são?"),
              Text(_value, style: TextStyle(fontSize: 32),)
            ],
          ),
        ),
      ),
    );
  }

}