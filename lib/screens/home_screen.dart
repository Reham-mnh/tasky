import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasky/app_color/app_color_dark.dart';
import 'package:tasky/controller/cubit/task_cubit.dart';
import 'package:tasky/screens/add_task_screen.dart';
import 'package:tasky/widgets/home_appbar.dart';
import 'package:tasky/widgets/tasks_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),

      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final taskCubit = context.read<TaskCubit>();
          final allEntries = taskCubit.tasksMap.entries.toList();
          final completedTasks =
              state.tasksList.where((e) => e.isDone == true).toList();
          final percent = (completedTasks.length / allEntries.length);
          final percentage = (completedTasks.length / allEntries.length) * 100;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yuhuu ,Your work Is ',
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge!.copyWith(fontSize: 32),
                  ),
                  Row(
                    children: [
                      Text(
                        'almost done ! ',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge!.copyWith(fontSize: 32),
                      ),

                      SvgPicture.asset('assets/hand.svg'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(
                        'Achieved Tasks',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      subtitle: Text(
                        '${completedTasks.length} Out of ${state.tasksList.length} Done',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: CircularPercentIndicator(
                        radius: 24,
                        center: Text(
                          '$percentage%',
                          style: Theme.of(
                            context,
                          ).textTheme.displayMedium!.copyWith(fontSize: 14),
                        ),
                        percent: percent,
                        progressColor: AppColorDark.mainColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'My Tasks',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tasksList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final task = allEntries[index].value;
                        final key = allEntries[index].key;
                        return TasksWidget(
                          task: task,
                          onToggle: () {
                            context.read<TaskCubit>().selectTask(key);
                          },
                        );
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTaskScreen(),
                          ),
                        );
                        if (result == true) {
                          context.read<TaskCubit>().getTasks();
                        }
                      },
                      label: Text('Add New Task'),
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
