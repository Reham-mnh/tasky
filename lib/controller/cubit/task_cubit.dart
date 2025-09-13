import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tasky/models/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    final taskBox = Hive.box<TaskModel>('tasks');
    getTasks();
  }

  final taskBox = Hive.box<TaskModel>('tasks');

  addTask(TaskModel task) async {
    var taskBox = Hive.box<TaskModel>('tasks');
    await taskBox.add(task);
    var tasks = taskBox.values.toList();
    emit(TaskUpdate(tasks));
  }

  void getTasks() {
    var tasks = taskBox.values.toList();
    emit(TaskUpdate(tasks));
  }

  selectTask(dynamic key) {
    final selectedTask = taskBox.get(key);
    if (selectedTask != null) {
      final updateTask = selectedTask.copyWith(isDone: !selectedTask.isDone);
      taskBox.put(key, updateTask);

      emit(TaskUpdate(taskBox.values.toList()));
    }
  }

  Map<dynamic, TaskModel> get tasksMap => taskBox.toMap();
}
