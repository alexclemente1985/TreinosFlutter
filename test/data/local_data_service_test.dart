import 'package:flutter_test/flutter_test.dart';
import 'package:memorando/data/local_database_service.dart';
import 'package:memorando/domain/models/task/task.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){
  late final LocalDatabaseService localDatabaseService;

  setUpAll(
    () async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      localDatabaseService = LocalDatabaseService();

      await localDatabaseService.init(inMemoryDatabase: true);
    }
  );

  test("BD deve inicializar corretamente", () async {
    expect(localDatabaseService.database?.isOpen, equals(true));
  });

  group("Testes de Tasks", (){
    test("Deverá criar uma task na tabela", () async{
      final task = Task(title: "Fazer dever de casa", description: "descrição", category: "atividades", isCompleted: false, priority: "alta", responsible: "Tester");

      final result = await localDatabaseService.createTask(task);
      expect(result, isNot(equals(null)));
    });

    test("Deverá listar os itens salvos", () async{
      final task = Task(title: "Lavar louças", description: "descrição", category: "atividades", isCompleted: false, priority: "alta", responsible: "Tester");

      await localDatabaseService.createTask(task);

      final result = await localDatabaseService.getTasks();
      expect(result.length, equals(2));
    });

    test("Deverá listar os itens completados", () async{
      final task = Task(title: "Arrumar casa", description: "descrição", category: "atividades", isCompleted: true, priority: "alta", responsible: "Tester");

      await localDatabaseService.createTask(task);

      final result = await localDatabaseService.getTasks(isCompleted: true);
      expect(result.length, equals(1));
    });

    test("Deverá atualizar uma informação de uma task", () async{
      final task = Task(title: "Beber água", description: "descrição", category: "rotina", isCompleted: false, priority: "alta", responsible: "Tester");

      final taskId = await localDatabaseService.createTask(task);
      final newTask = await localDatabaseService.getTaskById(taskId!);
      
      expect(newTask?.title, equals(task.title));

      final editedTask = Task(id: newTask!.id, title: "Beber água gaseificada", description: newTask!.description, category: newTask.category, isCompleted: newTask.isCompleted, priority:newTask.priority, responsible: newTask.responsible);

      final result = await localDatabaseService.updateTask(editedTask);
      expect(result, isNot(equals(null)));

      final newEditedTask = await localDatabaseService.getTaskById(taskId);
      expect(newEditedTask?.title, equals(editedTask.title));
    });

    test("Deverá apagar uma task", () async{
      final task = Task(title: "Task a ser removida", description: "descrição", category: "rotina", isCompleted: false, priority: "alta", responsible: "Tester");

      final taskId = await localDatabaseService.createTask(task);
      final newTask = await localDatabaseService.getTaskById(taskId!);
      
      expect(newTask?.title, equals(task.title));

      // final editedTask = Task(id: newTask!.id, title: "Beber água gaseificada", description: newTask!.description, category: newTask.category, isCompleted: newTask.isCompleted, priority:newTask.priority, responsible: newTask.responsible);

      final result = await localDatabaseService.deleteTask(taskId);
      expect(result, isNot(equals(null)));

      final deletedTask = await localDatabaseService.getTaskById(taskId);
      expect(deletedTask, equals(null));
    });
  });
}