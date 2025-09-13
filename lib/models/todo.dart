class Todo {
  Todo({required this.title, required this.dateTime, required this.taskCompleted});

  Todo.fromJson(Map<String, dynamic> json)
  : title = json['title'],
    dateTime = DateTime.parse(json['dateTime']),
    taskCompleted = json['taskCompleted'];

  String title;
  DateTime dateTime;
  bool taskCompleted;  

  Map<String, dynamic> toJson(){
    // Nota: toIso8601String() permite a conversão para datetime de maneira mais fácil
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
      'taskCompleted': taskCompleted
    };
  }
}