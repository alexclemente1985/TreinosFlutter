import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/custom_widget_test.dart';

class CustomWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CustomWidgetState();
}

class CustomWidgetState extends State<CustomWidget>{
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
              CustomWidgetTest()
            ],
          ),
        ),
      ),
    );
  }
  
}