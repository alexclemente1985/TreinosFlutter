class Task {
  final int? id;
  final String title;
  final String description;
  final String category;
  final bool isCompleted;
  final String priority;
  final String? responsible;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.isCompleted,
    required this.priority,
    required this.responsible
  });

  factory Task.fromMap(Map<String,dynamic> data){
    return Task(
      title: data['title'], 
      description: data['description'], 
      category: data['category'], 
      isCompleted: data['isCompleted'] == 1,
      id: data['id'],
      priority: data['priority'] ?? '',
      responsible: data['responsible'] ?? ''
    );
  }

  Map<String, dynamic> toMap({int? responsibleId}){
    return {
      
      'title': title,
      'description': description,
      'category': category,
      'isCompleted': isCompleted ? 1 : 0,
      'priority': priority,
      'responsibleId': responsibleId
    };
  }
}
