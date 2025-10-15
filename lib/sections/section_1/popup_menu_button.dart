import 'package:flutter/material.dart';


enum Animals{Cat, Dog, Bird, Lizard, Fish}

class PopupMenuButtonWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PopupMenuButtonState();
}

class PopupMenuButtonState extends State<PopupMenuButtonWidget>{
  Animals _selected = Animals.Cat;
  String _value = "Escolha um bicho...";
  List<PopupMenuItem> _items = <PopupMenuItem>[];

  @override
  void initState(){
    for(Animals animal in Animals.values){
      _items.add(
        PopupMenuItem(
          child: Text(_getDisplay(animal)
        ),
        value: animal,));
    }
  }

  void _onSelected(dynamic animal){
    setState(() {
      _selected = animal;
      _value = "Você selecionou ${_getDisplay(animal)}.";
    });
  }

  String _getDisplay(Animals animal){
    int index = animal.toString().indexOf(".");
    index++;
    return animal.toString().substring(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltip"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(_value)
              ),
              PopupMenuButton(
                child: Icon(Icons.input),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
                itemBuilder: (context){
                  return _items;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  
}