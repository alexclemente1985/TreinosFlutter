import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nimble_charts/flutter.dart' as charts;

class Sales{
  String year;
  int sales;
  
  Sales(this.year, this.sales);
}

class Charts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ChartsState();
}

class ChartsState extends State<Charts>{

  late List<Sales> _data;
  late List<charts.Series<Sales, String>> _chartData;

  void _makeData(){
    _data = <Sales>[];
    _chartData = <charts.Series<Sales, String>>[];

    final rnd = new Random();
    for(int i = 2010; i< 2019; i++){
      _data.add(Sales(i.toString(),rnd.nextInt(1000)));
    }

    _chartData.add(charts.Series(
      id: 'Sales', 
      colorFn: (_,_)=> charts.MaterialPalette.green.shadeDefault,
      data: _data,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _)=> sales.sales,
      fillPatternFn: (_,_)=> charts.FillPatternType.solid,
      displayName: "sales"
      ),
      
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
        title: Text("Charts"),
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
                child: charts.BarChart(_chartData)
              )
            ],
          ),
        ),
      ),
    );
  }
}