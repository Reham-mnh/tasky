import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/controller/cubit/task_cubit.dart';
import 'package:tasky/widgets/tasks_widget.dart';

class TodoTaskScreen extends StatelessWidget {
  const TodoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('To DO Tasks'), leading: BackButton()),
        body: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            final taskCubit = context.read<TaskCubit>();
            final uncompletedTasks =
                taskCubit.tasksMap.entries
                    .where((entry) => entry.value.isDone == false)
                    .toList();
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 26.0,
                horizontal: 16,
              ),
              child: ListView.builder(
                itemCount: uncompletedTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = uncompletedTasks[index].value;
                  final key = uncompletedTasks[index].key;
                  return TasksWidget(
                    task: task,

                    onToggle: () {
                      context.read<TaskCubit>().selectTask(key);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
