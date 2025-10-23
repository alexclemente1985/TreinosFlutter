import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nimble_charts/flutter.dart' as charts;

class Sales{
  String year;
  int sales;
  
  Sales(this.year, this.sales);
}

class GroupingData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GroupingDataState();
}

class GroupingDataState extends State<GroupingData>{

  late List<Sales> _laptops;
  late List<Sales> _desktops;
  late List<charts.Series<Sales, String>> _chartData;

  void _makeData(){
    _laptops = <Sales>[];
    _desktops = <Sales>[];
    _chartData = <charts.Series<Sales, String>>[];

    final rnd = new Random();
    for(int i = 2010; i< 2019; i++){
      _laptops.add(Sales(i.toString(),rnd.nextInt(1000)));
      _desktops.add(Sales(i.toString(),rnd.nextInt(1000)));
    }

    _chartData.add(charts.Series(
      id: 'Sales', 
      colorFn: (_,_)=> charts.MaterialPalette.green.shadeDefault,
      data: _laptops,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _)=> sales.sales,
      fillPatternFn: (_,_)=> charts.FillPatternType.solid,
      displayName: "sales"
      )      
    );

    _chartData.add(charts.Series(
      id: 'Sales', 
      colorFn: (_,_)=> charts.MaterialPalette.deepOrange.shadeDefault,
      data: _desktops,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _)=> sales.sales,
      fillPatternFn: (_,_)=> charts.FillPatternType.solid,
      displayName: "sales"
      )      
    );
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GroupingData"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text("Dados de Vendas"),
              Expanded(
                child: charts.BarChart(_chartData, vertical: false,)
              )
            ],
          ),
        ),
      ),
    );
  }
}