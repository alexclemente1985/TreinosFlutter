import 'package:memorando/domain/models/task/task.dart';

abstract class TaskRepository {
  Future<int> addTask(Task task);
  Future<List<Task>> getTasks({bool? isCompleted});
  Future<int?> updateTask(Task task);
  Future<int?> deleteTask(int id);
}
