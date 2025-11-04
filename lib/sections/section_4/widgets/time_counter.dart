import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_display.dart';

class TimeCounter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TimeCounterState();
}

class TimeCounterState extends State<TimeCounter>{
  late Stopwatch _watch;
  late Timer _timer;
  late Duration _duration;

  void _onStart(){
    setState(() {
      _watch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 250), _onTimeOut);      
    });

    _watch.start();
  }
  void _onStop(){
    _timer.cancel();
    _watch.stop();
  }
  
  void _onTimeOut(Timer timer){
    if(!_watch.isRunning) return;
    setState(() {
      _duration = _watch.elapsed;
    });
  }

  void _onClear(Duration value){
    setState(() {
      _duration = Duration();
    });
  }

  @override
  void initState(){
    _duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            TimeDisplay(
              key: Key('time'),
              color: Colors.red, 
              duration: _duration, 
              onClear: _onClear
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: _onStart, child: Text('Start')),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: _onStop, child: Text('Stop')),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
  
}