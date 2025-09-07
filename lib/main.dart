import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/database/app_database.dart';
import 'package:tasky/screens/welcome_screen.dart';
import 'package:tasky/them_data/theme_data_dark.dart';
import 'package:tasky/them_data/theme_data_light.dart';
import 'package:tasky/widgets/bottom_nav_bar_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await AppDatabase().database;
   

    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    final String? userName= sharedPreferences.getString('userName');

  runApp(
     MyApp(userName: userName),
  );
}

class MyApp extends StatefulWidget {
  
  const MyApp( {super.key, required this.userName});
 final String? userName;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeDataDark(),

      home:(widget.userName==null)? WelcomeScreen():BottomNavBarWidget(),
    );
  }
}
