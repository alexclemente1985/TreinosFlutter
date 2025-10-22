import 'package:flutter/material.dart';

class Section2 extends StatefulWidget{
  Map<String, String> routes;

  Section2({required this.routes});

  @override
  State<StatefulWidget> createState() => Section2State();
}

class Section2State extends State<Section2>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          title: Text("Section 2"),
        ),
        body: Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["expansion_panel"]!);
                    },
                    child: Text("Expansion Panel")
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["tab_bar_view"]!);
                    },
                    child: Text("Tab Bar View")
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["stepper"]!);
                    },
                    child: Text("Stepper")
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, widget.routes["gridview"]!);
                    },
                    child: Text("GridView")
                  ),
                ],
              ),
            ),
          ),
    );
  }
}