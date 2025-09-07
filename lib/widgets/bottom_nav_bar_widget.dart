import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/models/nav_bar.dart';
import 'package:tasky/screens/completed_task_screen.dart';
import 'package:tasky/screens/home_screen.dart';
import 'package:tasky/screens/profile_screen.dart';
import 'package:tasky/screens/todo_task_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}
class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentIndex = 0;
  List <Widget> widgets=[
     HomeScreen(),
     TodoTaskScreen(),
     CompletedTaskScreen(),
     ProfileScreen()
    ];
  BottomNavigationBarItem items(NavBarModel navbar) {
    
    return  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        navbar.imagePath,
        colorFilter: ColorFilter.mode(
          currentIndex == navbar.index
              ? const Color(0xff15B86C)
              : Colors.white,
          BlendMode.srcIn,
        ),
      ),
      label: navbar.label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widgets[currentIndex],
   bottomNavigationBar:  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff181818),
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      currentIndex: currentIndex,
      selectedItemColor: Color(0xff15B86C),
      items: [
        items(NavBarModel(index: 0, imagePath: 'assets/Icon.svg', label:  'Home')),
        items(NavBarModel(index: 1, imagePath: 'assets/todo.svg', label: 'To Do')),
        items(NavBarModel(index: 2, imagePath: 'assets/completed.svg', label: 'Completed')),
        items(NavBarModel(index: 3, imagePath: 'assets/profiles.svg', label:'Profile' )),

      ],
    ));
  }
}
