import 'package:flutter/material.dart';

class MyItem{
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class ExpansionPanelWidget extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => ExpansionPanelState();
}

class ExpansionPanelState extends State<ExpansionPanelWidget>{
    List<MyItem> _items = [];
  
  @override
  void initState(){
    for(int i = 0; i<10; i++){
      _items.add(new MyItem(false, "Item ${i}", new Container(
        padding: EdgeInsets.all(10),
        child: Text("Container ${i}"),
      )));
    }
  }

  ExpansionPanel _createItem(MyItem item){
    return ExpansionPanel(
    headerBuilder: (BuildContext context, bool isExpanded){
      return Container(
        padding: EdgeInsets.all(5),
        child: Text("Header ${{item.header}}"),
      );
    }, 
    body: item.body,
    isExpanded: item.isExpanded
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion Panel"),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded){
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createItem).toList()
            )
          ],
        ),
      ),
    );
  }
  
}