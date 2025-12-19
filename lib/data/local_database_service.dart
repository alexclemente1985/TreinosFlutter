import 'package:flutter/material.dart';
import 'package:memorando/domain/models/task/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDatabaseService {
  static Database? _database;

  Database? get database => _database;

  Future<void> init({bool? inMemoryDatabase = false}) async {
    late String dbPath;
    if(inMemoryDatabase != null){
      dbPath = inMemoryDatabasePath;
    }
    else{
      final path = await getDatabasesPath();
      dbPath = join(path, 'tasks.db');
    }

    _database = await openDatabase(
      dbPath,
      version: 3,
      onCreate: (db, version) async{
        
        String sql = 
        """
          CREATE TABLE IF NOT EXISTS tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT NOT NULL, 
          description TEXT,
          category TEXT, 
          isCompleted INTEGER DEFAULT 0
          )
        """;

        // String sql = "CREATE TABLE tasks(";
        // sql += "id INTEGER PRIMARY KEY AUTOINCREMENT, ";
        // sql += "title TEXT, ";
        // sql += "category TEXT, ";
        // sql += "isCompleted INTEGER DEFAULT 0)";
        await db.execute(sql);
        debugPrint("Banco de dados criado!");
        if(version >= 2){
          await addPriorityColumToTasksTable(db);
        }

        if(version >= 3){
          await createResponsiblesTable(db);
        }
      },
      onUpgrade:(db, oldVersion, newVersion) async {
        if(oldVersion < 2){
          await addPriorityColumToTasksTable(db);
        }

        if(oldVersion < 3){
          await createResponsiblesTable(db);
        }
        debugPrint("new version: $newVersion");
      },
      onDowngrade: (db, oldVersion, newVersion) {
        debugPrint("new version: $newVersion | previous version: $oldVersion");
      },
    );
  }

  Future<void> addPriorityColumToTasksTable(Database db) async{
    db.execute('ALTER TABLE tasks ADD COLUMN priority TEXT DEFAULT "medio"');
    debugPrint("Nova coluna adicionada: PRIORITY");
  }

  Future<void> createResponsiblesTable(Database db) async{
    await db.execute("""CREATE TABLE responsibles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )""");
    db.execute(
            'ALTER TABLE tasks ADD COLUMN responsibleId INTEGER REFERENCES responsibles(id)'
          );
    debugPrint("Nova tabela adicionada: RESPONSIBLES");
    debugPrint("Nova constraint adicionada na tabela TASKS: RESPONSIBLESID (responsibles(id))");
  }

  Future<int?> createTask(Task task) async {
    int? responsibleId;

    if(task.responsible != null){
      final responsibles = await _database?.query('responsibles', where: 'name LIKE ?', whereArgs: [task.responsible]);
      
      if(responsibles != null && responsibles.isNotEmpty){
        responsibleId = responsibles.first['id'] as int;
      }
      else{
        final result = await _database?.insert('responsibles', {
          'name': task.responsible
        });
      }
    }

    final int? id = await _database?.insert('tasks', task.toMap(responsibleId: responsibleId));
    debugPrint("task criada ${id}");
    return id;
  }

  Future<List<Task>> getTasks({bool? isCompleted }) async{
    
    List<String> where = [];
    List<dynamic> whereArgs = [];

    if(isCompleted != null){
      where.add('isCompleted = ?');
      whereArgs.add(isCompleted ? 1 : 0);
    }

    final whereString = where.isNotEmpty ? where.join(' AND ') : null;

    // final result = await _database?.query(
    //   'tasks', 
    //   whereArgs: whereArgs,
    //   where: whereString
    // );
    String sql = """
                  SELECT t.*, r.name AS responsible
                  FROM tasks AS t
                  LEFT JOIN responsibles AS r ON t.responsibleId = r.id
                  ${whereString != null ? 'WHERE $whereString' : ''}
                 """;
    final result = await _database?.rawQuery(sql, whereArgs);


    final tasks = result?.map((e)=> Task.fromMap(e)).toList();
    //return result != null ? List.generate(result.length, (i) => Task.fromMap(result[i])) : [];

    return tasks ?? [];
  }

  Future<int?> updateTask(Task task) async {
    final result = await _database?.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
    print('Tarefa atualizada: ${task.title}');
    return result;
  }

  Future<int?> deleteTask(int taskId) async {
    
    final result = await _database?.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
    
    return result;
  }

  Future<Task?> getTaskById(int taskId) async{
    final result = await _database?.query('tasks', where: 'id = ?', whereArgs: [taskId]);

    final tasks = result?.map((e)=> Task.fromMap(e)).toList();
    return tasks?.isNotEmpty ?? false ? tasks?.first : null;
  }


}