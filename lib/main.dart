import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/pages/todo_list_pages.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TodoListPage(),
    );
  }
}
