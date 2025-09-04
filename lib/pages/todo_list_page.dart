
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/models/todo.dart';
import 'package:lista_tarefas_flutter/widgets/todo_list-item.dart';

class TodoListPage extends StatefulWidget{
  TodoListPage({super.key}); // quando se cria um controller já não se pode manter o const na frente

  @override
  State<StatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  void deleteAllTasks(){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Remover todas as tarefas?"),
      content: Text("Você tem certeza que deseja remover todas as tarefas?"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff00d7f3), 
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          ), 
          child: Text("Cancelar")
        ),
        TextButton(
          onPressed: (){
            setState(() {
              todos.clear();
              Navigator.of(context).pop();
            });            
          },  
          style: TextButton.styleFrom(
            backgroundColor: Colors.red, 
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          ),
          child: Text("Limpar Tudo")
        ),
      ],
    ),);
    
  }

  void deleteTask(int index){
    var todo = todos[index];

    setState(() {      
      todos.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Tarefa ${todo.title} foi removida com sucesso!", style: TextStyle(color: Color(0xff060708)),),
          backgroundColor: Colors.white,
          action: SnackBarAction(
          label: "Desfazer", 
          textColor: const Color(0xff00d7f3),
          onPressed: (){
            setState(() {
              todos.insert(index, todo);
            });
          }
          ),
          duration: const Duration(seconds: 5),
        )
      );
  }

  void saveNewTask(){
    setState(() {
      var todo = Todo(title: todoController.text, dateTime: DateTime.now(), taskCompleted: false);
      todos.add(todo);
      todoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Color(0xff00d7f3),
        foregroundColor: Colors.white,

      ),
     
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                            controller: todoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Adicione uma tarefa",
                              hintText: "Ex. Criar aplicativo de tarefas"
                            ),
                          ),

                  ),
                   SizedBox(width: 8,),
                   ElevatedButton(
                    onPressed: saveNewTask, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00d7f3),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    )
                  ]
              ),
              SizedBox(height: 16,),
              Expanded(
                child: 
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index){
                    final todo = todos[index];
                    return TodoListItem(todo: todo, deleteFunction: (contex)=> deleteTask(index));
                  },
              )),
              SizedBox(height: 16,),              
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                    "Você possui ${todos.length} tarefas pendentes"
                  ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: deleteAllTasks, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff00d7f3),
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: Text("Limpar Tudo"),
                    ) 
                  )
                ],
              )
            ],
          )
        )        
       )
      //)
    ));
  }
}