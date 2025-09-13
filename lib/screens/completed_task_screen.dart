import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/controller/cubit/task_cubit.dart';
import 'package:tasky/widgets/tasks_widget.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final taskCubit = context.read<TaskCubit>();
        final completedTasks =
            taskCubit.tasksMap.entries
                .where((entry) => entry.value.isDone)
                .toList();
        return Scaffold(
          appBar: AppBar(title: Text('Completed Tasks'), leading: BackButton()),

          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = completedTasks[index].value;
                final key = completedTasks[index].key;
                return TasksWidget(
                  task: task,

                  onToggle: () {
                    context.read<TaskCubit>().selectTask(key);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
