import 'package:flutter/material.dart';
import 'package:tasky/models/task.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key, required this.task, required this.onToggle});
  final TaskModel task;
  final VoidCallback onToggle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
        ),
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (value) {
              onToggle();
              // context.read<TaskCubit>().isSelected(
              //   AppDatabase().getTasks()[index][],
              // );
            },
            activeColor: const Color(0xff15B86C),
            checkColor: Colors.white,
          ),

          title: Text(
            task.taskName,
            style: TextStyle(
              color: task.isDone ? Color(0xffA0A0A0) :Theme.of(context).textTheme.displayMedium!.color,
              decoration:
                  task.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
              decorationColor: Color(0xffA0A0A0),
              decorationThickness: 2,
            ),
          ),
          subtitle: Text(task.description),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
