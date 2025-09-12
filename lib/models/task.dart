import 'package:hive_ce/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String taskName;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isDone;

  const TaskModel({
    this.id,
    required this.taskName,
    required this.description,
    required this.isDone,
  });

  // TaskModel copyWith({
  //   int? id,
  //   String? taskName,
  //   String? description,
  //   bool? isDone,
  // }) {
  //   return TaskModel(
  //     id: id ?? this.id,
  //     taskName: taskName ?? this.taskName,
  //     description: description ?? this.description,
  //     isDone: isDone ?? this.isDone,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id':id,
  //     'taskName': taskName,
  //     'description': description,
  //     'isDone': isDone?1:0,
  //   };
  // }

  // factory TaskModel.fromJson(Map<String, dynamic> map) {
  //   return TaskModel(
  //      id:map['id']as int,
  //     taskName: map['taskName']as String,
  //     description: map['description']as String,
  //     isDone: (map['isDone'] as int)==1,
  //   );
  // }

  // @override
  // // TODO: implement props
  // List<Object?> get props => [id, taskName, description, isDone];
}
