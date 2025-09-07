import 'package:flutter/material.dart';

import 'package:tasky/database/app_database.dart';
import 'package:tasky/models/task.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final taskNameController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
        backgroundColor: Color(0xff181818),
        foregroundColor: Color(0xffFFFCFC),
      ),

      body:SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 26),
                  CustomTextField(
                    controller: taskNameController,
                    title: 'Task Name',
                    hintText: 'Finish UI design for login screen',
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: descriptionController,
                    title: 'Task Description',
                    hintText:
                        'Finish onboarding UI and hand off to devs by Thursday.',
                    maxLines: 5,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'High Priority',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 16),
                      ),
                      Spacer(),
                      Switch(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = value;
                          });
                        },
                        activeColor: Color(0xff15B86C),
                        thumbColor: WidgetStateProperty.all(Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await AppDatabase().insertTask(
                          TaskModel(
                            taskName: taskNameController.text,
                            description: descriptionController.text,
                            isDone: false,
                          ),
                        );
                        
                        Navigator.pop(
                          context,
                         true,
                        );
                     
                      },
                      label: Text('Add Task'),
                      icon: Icon(Icons.add),
                      style: ButtonStyle(
                        maximumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 56),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      )
       
      );
   
  }
}
