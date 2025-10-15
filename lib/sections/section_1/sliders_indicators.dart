import 'package:flutter/material.dart';

class SlidersIndicators extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SlidersIndicatorsState();
}

class SlidersIndicatorsState extends State<SlidersIndicators>{
  double _value = 0.0;

  void _onChanged(double value){
    setState(() {
      _value = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltip"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Slider(value: _value, onChanged: _onChanged),
              Container(
                padding: EdgeInsets.all(32),
                child: LinearProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}