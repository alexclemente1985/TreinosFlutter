import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nimble_charts/flutter.dart' as charts;

class Sales{
  int year;
  int sales;
  charts.Color color;
  
  Sales(this.year, this.sales, this.color);
}

class AnimatedPieChart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AnimatedPieChartState();
}

class AnimatedPieChartState extends State<AnimatedPieChart>{

  late List<Sales> _data;
  late List<charts.Series<Sales, int>> _chartData;

  void _makeData(){
    _chartData = <charts.Series<Sales, int>>[];
    _data = <Sales>[
      Sales(0,Random().nextInt(100),charts.MaterialPalette.red.shadeDefault),
      Sales(1,Random().nextInt(100),charts.MaterialPalette.blue.shadeDefault),
      Sales(2,Random().nextInt(100),charts.MaterialPalette.green.shadeDefault),
      Sales(3,Random().nextInt(100),charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartData.add(charts.Series(
      id: 'Sales', 
      data: _data,
      colorFn: (Sales sales,_)=> sales.color,      
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _)=> sales.sales
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
        title: Text("AnimatedPieChart"),
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
                child: charts.PieChart(
                  _chartData,
                  animate: true,
                  animationDuration: Duration(seconds: 3),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}