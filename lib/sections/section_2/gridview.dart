import 'dart:math';

import 'package:flutter/material.dart';

class Area{
  int index;
  String name;
  Color color;
  Area({this.index = -1, this.name = "Area", this.color = Colors.lightBlueAccent});
}

class GridviewWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => GridviewWidgetState();
}

class GridviewWidgetState extends State<GridviewWidget>{

  late int _location;
  late List<Area> _areas;

  @override
  void initState() {
    _areas = [];
    for(int i = 0; i< 16; i++){
      _areas.add(Area(index: i, name: "Area ${i}"));
    }

    var rng = Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generate(int index){
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => _onPressed(index), 
          style: ElevatedButton.styleFrom(
            backgroundColor: _areas[index].color
          ),
          child: Text(_areas[index].name, textAlign: TextAlign.center)
        ),
      )
    );
  }

  void _onPressed(int index){
    setState(() {
      if(index == _location){
        _areas[index].color = Colors.green;
      }
      else{
        _areas[index].color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: GridView.count(
            crossAxisCount: 4,
            children: List<Widget>.generate(16, _generate),
          ),
        ),
      ),
    );
  }
}