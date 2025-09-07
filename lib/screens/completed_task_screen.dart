import 'package:flutter/material.dart';
import 'package:tasky/database/app_database.dart';
import 'package:tasky/models/task.dart';
import 'package:tasky/widgets/tasks_widget.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<TaskModel> completedTaks = [];
  @override
  void initState() {
    super.initState();
    getData();
  }
 isSelected(TaskModel model) async {
    final updatedTask = model.copyWith(isDone: !model.isDone);
    await AppDatabase().updateTask(updatedTask);
    getData();
  }
  void getData() async {
    final completedList = await AppDatabase().getSelectedTasks();
    setState(() {
      completedTaks = completedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed Tasks'),
      leading: BackButton(),
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0),
        child: ListView.builder(
          itemCount: completedTaks.length,
          itemBuilder: (BuildContext context, int index) {
            return TasksWidget(task: completedTaks[index], onToggle: () {isSelected(completedTaks[index]);});
          },
        ),
      ),
    );
  }
}
