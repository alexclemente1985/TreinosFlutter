import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_tarefas_flutter/models/todo.dart';

class TodoListItem extends StatelessWidget{
  const TodoListItem({super.key, required this.todo, required this.deleteFunction});

  final Todo todo;
  final Function(BuildContext)? deleteFunction;

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Slidable(      
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const DrawerMotion(), 
        children: [
          SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          label: 'Delete',
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        )]
      ),
      child: Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,        
          children: [
            Text(DateFormat('dd/MM/yyyy - HH:mm:ss').format(todo.dateTime), style: TextStyle(
              fontSize: 12
            )),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.7),
              child: Text(
              todo.title,
              softWrap: true,
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            )),
            )
        ],
        )
      ]),
    ),
    );
  }
}