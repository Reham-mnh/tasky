part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState(this.tasksList);
  final List<TaskModel> tasksList;

  @override
  List<Object> get props => [tasksList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class TaskUpdate extends TaskState {
  const TaskUpdate(super.tasksList);
}
