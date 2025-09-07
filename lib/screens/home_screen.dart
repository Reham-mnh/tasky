import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/database/app_database.dart';
import 'package:tasky/models/task.dart';
import 'package:tasky/screens/add_task_screen.dart';
import 'package:tasky/widgets/home_appbar.dart';
import 'package:tasky/widgets/tasks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> lists = [];
 

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    final reslist = await AppDatabase().getTasks();
    setState(() {
      lists = reslist;
    });
  }

  isSelected(TaskModel model) async {
    final updatedTask = model.copyWith(isDone: !model.isDone);
    await AppDatabase().updateTask(updatedTask);
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar( ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yuhuu ,Your work Is ',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              Row(
                children: [
                  Text(
                    'almost done ! ',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
        
                  SvgPicture.asset('assets/hand.svg'),
                ],
              ),
              Text('My Tasks', style: Theme.of(context).textTheme.displayMedium),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: lists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TasksWidget(
                      task: lists[index],
                      onToggle: () {
                        isSelected(lists[index]);
                      },
                    );
                  },
                ),
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTaskScreen()),
                      );
                      if (result == true) {
                        getData();
                      }
                    },
                    label: Text('Add New Task'),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
