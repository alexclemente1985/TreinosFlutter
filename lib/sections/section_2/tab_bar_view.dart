import 'package:flutter/material.dart';

class Choice{
  final String title;
  final IconData icon;

  const Choice(this.title, this.icon);
}

class TabBarViewWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TabBarViewState();
}

class TabBarViewState extends State<TabBarViewWidget> with SingleTickerProviderStateMixin{
  late TabController _controller;

  List<Choice> _items = const <Choice>[
    const Choice("CAR", Icons.directions_car),
    const Choice("BICYCLE", Icons.directions_bike),
    const Choice("BOAT", Icons.directions_boat),
    const Choice("BUS", Icons.directions_bus),
    const Choice("TRAIN", Icons.directions_train),
    const Choice("WALK", Icons.directions_walk),
  ];
  
  @override
  void initState(){
    _controller = new TabController(length: _items.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar View"),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48), 
          child: Theme(
            data: Theme.of(context).copyWith(hintColor: Colors.white), 
            child: Container(
              height: 48,
              alignment: Alignment.center,
              child: TabPageSelector(controller: _controller),
            )
            )
          ),
      ),
      body: TabBarView(
          controller: _controller,
          children: _items.map((Choice item){
            return Container(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Column(
                  children: [
                    Text(item.title),
                    Icon(item.icon, size: 120,)
                  ],
                  )
              ),
            );
          }).toList()
        )
    );
  }

}