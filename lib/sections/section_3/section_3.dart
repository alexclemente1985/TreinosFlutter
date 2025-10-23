import 'package:flutter/material.dart';

class Section3 extends StatefulWidget{
  Map<String, String> routes;

  Section3({required this.routes});

  @override
  State<StatefulWidget> createState() => Section3State();
}

class Section3State extends State<Section3>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: Text("Section 3"),
        ),
        body: Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["charts"]!);
                    },
                    child: Text("Charts")
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["grouping_data"]!);
                    },
                    child: Text("Grouping Data")
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["animated_pie_charts"]!);
                    },
                    child: Text("Animated Pie Charts")
                  )
                ],
              ),
            ),
          ),
    );
  }
}