import 'package:flutter/material.dart';

class ChipsKeysChildren extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ChipsKeysChildrenState();
}

class ChipsKeysChildrenState extends State<ChipsKeysChildren>{
  int counter = 0;

  final List<Widget> _list = <Widget>[];

  @override
  void initState(){
    for (int i = 0; i < 5; i++){
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked(){
    Widget child = _newItem(counter);
    setState(() {
      _list.add(child);
    });
  }

  Widget _newItem(int i){
    Key key = Key("item ${i}");
    // print("key ${key}");
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10),
      child: Chip(
        label: Text("${i} item"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "Apagar",
        onDeleted: ()=> _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade500,
          child: Text(i.toString()),
        ),
        ),
    );
    counter ++;
    return child;
  }

  void _removeItem(Key key){
    for(int i = 0; i< _list.length; i++){
      Widget child = _list.elementAt(i);

      if(child.key == key){
        setState(() {
          _list.removeAt(i);
          print("Removendo ${key.toString()}");
          counter--;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chips Keys and Children"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: Icon(Icons.add),
        ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: _list
          ),
        ),
      ),
    );
  }
}