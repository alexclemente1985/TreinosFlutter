import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
import 'package:flutter_intermediate/sections/section_4/widgets/time_counter.dart';
import 'package:flutter_intermediate/sections/section_5/widget/my_widget.dart';

class NavFromChild extends StatefulWidget{
  const NavFromChild({super.key});

  @override
  State<StatefulWidget> createState() => NavFromChildState();
}

class NavFromChildState extends State<NavFromChild>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation - Nav. from Child Widget'),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              MyWidget(data: AppRoutes.routePaths)
            ],
          ),
        ),
      ),
    );
  }
  
}