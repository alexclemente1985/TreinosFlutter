import 'dart:ui';

import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget{
  TimeDisplay({required Key key, required Color this.color, required Duration this.duration, required this.onClear}) : super(key: key);
  
  Duration duration = Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;
  
  void _onClicked(){
    onClear(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(duration.toString(), style: TextStyle(fontSize: 32, color: color),),
        ),
        IconButton(
          onPressed: _onClicked,
          icon: Icon(Icons.clear)
          ), 
      ],
    );
  }
}