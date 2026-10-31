enum TaskPriority {
  urgent,
  high,
  medium,
  low,
  none,
}

enum TaskStatus {
  backlog,
  todo,
  inProgress,
  done,
  canceled,
}

class TaskModel {
  final String id;
  String title;
  String description;
  TaskStatus status;
  TaskPriority priority;
  String assignee;
  List<String> labels;
  String project;
  DateTime? dueDate;
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description = '',
    this.status = TaskStatus.todo,
    this.priority = TaskPriority.medium,
    this.assignee = 'Nguyen Nhat Minh Quan',
    this.labels = const [],
    this.project = 'Linear Mobile App',
    this.dueDate,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignee,
    List<String>? labels,
    String? project,
    DateTime? dueDate,
    DateTime? createdAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      assignee: assignee ?? this.assignee,
      labels: labels ?? this.labels,
      project: project ?? this.project,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

