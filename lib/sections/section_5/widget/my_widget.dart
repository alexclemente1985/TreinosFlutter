import 'package:flutter/material.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';

class MyWidget extends StatefulWidget{
  MyWidget({required this.data});

  final Map<String, dynamic> data;

  @override
  State<StatefulWidget> createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget>{
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
          Text("Clique para navegar!"),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context,widget.data['section5']!);
              }, 
              child: Text("Ir Seção 5")
          ),
        ],
        ),
      ),
    );
  }
  
}