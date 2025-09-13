import 'dart:convert';

import 'package:lista_tarefas_flutter/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todoListKey = 'todo_list';

class TodoRepository {

  // TodoRepository(){
    // SharedPreferences -> permite o armazenamento de dados primitivos
  //   SharedPreferences.getInstance().then((value) {
  //     sharedPreferences = value;
  //     print(sharedPreferences.getString("todo_list"));
  //     });
  // }

  // Garante que somente vai ser utilizada após sua inicialização (evitando colocá-la como nullable)
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    // Pega todos os elementos do json como lista, e retorna a lista
    var list = jsonDecoded.map((e) => Todo.fromJson(e)).toList();
    print("jsonDecoded: ${list}");
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos){
    // converte a lista de tarefas em um texto bem definido, possibilitando a reconversão em uma lista de Todo`s
    final jsonString = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
  }
}