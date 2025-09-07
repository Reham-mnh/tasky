import 'package:flutter/material.dart';
import 'package:tasky/database/app_database.dart';
import 'package:tasky/models/task.dart';
import 'package:tasky/widgets/tasks_widget.dart';

class TodoTaskScreen extends StatefulWidget {
  const TodoTaskScreen({super.key});

  @override
  State<TodoTaskScreen> createState() => _TodoTaskScreenState();
}

class _TodoTaskScreenState extends State<TodoTaskScreen> {
  List<TaskModel> toDoList = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final completedList = await AppDatabase().getunSelectedTasks();
    setState(() {
      toDoList = completedList;
    });
  }

  isSelected(TaskModel model) async {
    final updatedTask = model.copyWith(isDone: !model.isDone);
    await AppDatabase().updateTask(updatedTask);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('To DO Tasks'),
          leading: BackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return TasksWidget(
                task: toDoList[index],
                onToggle: () {
                  isSelected(toDoList[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
