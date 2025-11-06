import 'package:flutter/material.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
import 'package:flutter_intermediate/sections/section_6/redux.dart';
import 'package:redux/redux.dart';

// Actions
enum FlutterActions {Increment, Decrement}

// Reducer
int reducer(int state, dynamic action){
  if(action == FlutterActions.Increment) state++;
  if(action == FlutterActions.Decrement) state--;

  return state;
}

class Section6 extends StatefulWidget{
  Section6({super.key});

  final store = Store(reducer, initialState: 0);

  @override
  State<StatefulWidget> createState() => Section6State();
}

class Section6State extends State<Section6>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seção 6 - State Management'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  // print({'routes': AppRoutes.routePaths});
                  Navigator.pushNamed(context, AppRoutes.routePaths['global_state_screen']!, arguments: {'routes': AppRoutes.routePaths});
                }, 
                child: Text('Global State')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.routePaths['passing_variables']!, arguments: {'routes': AppRoutes.routePaths});
                }, 
                child: Text('Passing Variables')
              ),
              ElevatedButton(
                onPressed: (){
                  // Navigator.pushNamed(context, AppRoutes.routePaths['redux']!, arguments: {'routes': AppRoutes.routePaths});
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)=> Redux(key: Key('store'),store: widget.store,)
                    ));                    
                }, 
                child: Text('Redux')
              ),
            ],
          ),
        ),
        ),
    );
  }
  
}