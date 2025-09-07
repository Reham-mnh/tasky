import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int? id;
  final String taskName;
  final String description;
  final bool isDone;

  const TaskModel({
     this.id,
    required this.taskName,
    required this.description,
    required this.isDone,
  });

  TaskModel copyWith({
    int? id,
    String? taskName,
    String? description,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'taskName': taskName,
      'description': description,
      'isDone': isDone?1:0,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
       id:map['id']as int,
      taskName: map['taskName']as String,
      description: map['description']as String,
      isDone: (map['isDone'] as int)==1,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, taskName, description, isDone];
}
