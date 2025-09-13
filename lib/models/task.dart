import 'package:hive_ce/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String taskName;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isDone;

  const TaskModel({
    required this.taskName,
    required this.description,
    required this.isDone,
  });

  TaskModel copyWith({String? taskName, String? description, bool? isDone}) {
    return TaskModel(
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
