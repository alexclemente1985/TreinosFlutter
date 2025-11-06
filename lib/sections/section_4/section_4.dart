import 'package:flutter/material.dart';

class Section4 extends StatefulWidget{
  Map<String, String> routes;

  Section4({required this.routes});

  @override
  State<StatefulWidget> createState() => Section4State();
}

class Section4State extends State<Section4>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seção 4 - Custom Widgets'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, widget.routes['custom_widget']!);
                }, 
                child: Text('Custom Widget')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, widget.routes['stateful_widget']!);
                }, 
                child: Text('Stateful Widget')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, widget.routes['widget_within']!);
                }, 
                child: Text('Widget Within')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, widget.routes['child_to_parent']!);
                }, 
                child: Text('Child To Parent')
              )
            ],
          ),
        ),
      ),
    );
  }

}