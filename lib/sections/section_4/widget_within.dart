import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';

class WidgetWithin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => WidgetWithinState();
}

class WidgetWithinState extends State<WidgetWithin>{
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
              Text('Stop Watch!'),
              TimeCounter()
            ],
          ),
        ),
      ),
    );
  }
  
}