import 'package:memorando/data/local_database_service.dart';
import 'package:memorando/data/repositories/task_repository.dart';
import 'package:memorando/domain/models/task/task.dart';

class LocalTaskRepository implements TaskRepository{
  final LocalDatabaseService localDatabaseService;

  LocalTaskRepository({required this.localDatabaseService});

  @override
  Future<int> addTask(Task task) async {
    final id = await localDatabaseService.createTask(task);
    return id ?? 0; //0 indica que o não foi criada a task, alertando sobre erro
  }

  @override
  Future<int?> deleteTask(int id) async {
    final result = await localDatabaseService.deleteTask(id);
  }

  @override
  Future<List<Task>> getTasks({bool? isCompleted}) async{
    final result = await localDatabaseService.getTasks(isCompleted: isCompleted);
    return result;
  }

  @override
  Future<int?> updateTask(Task task) async {
    return await localDatabaseService.updateTask(task);
  }
}