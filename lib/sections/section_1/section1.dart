import 'package:flutter/material.dart';

class Section1 extends StatefulWidget{

  Map<String, String> routes;

  Section1({required this.routes});

  @override
  State<StatefulWidget> createState() => Section1State();
}

class Section1State extends State<Section1>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          title: Text("Section 1"),
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(            
            child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, widget.routes["tooltips"]!, arguments: 1);
                }, 
                child: Text("Tooltips")
              ),
              ElevatedButton(
                onPressed: (){
                   Navigator.pushNamed(context,widget.routes["chips_keys_children"]!, arguments: 1);
                }, 
                child: Text("Chips, Keys and Children")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,widget.routes["sliders_indicators"]!, arguments: 1);
                }, 
                child: Text("Sliders and Indicators")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,widget.routes["popup_menu_button"]!, arguments: 1);
                }, 
                child: Text("PopupMenuButton")
              ),
            ],
          ),
        ),
      )
      );
  }
}