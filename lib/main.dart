import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/database/app_database.dart';
import 'package:tasky/screens/welcome_screen.dart';
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
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff181818),
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),
          foregroundColor: Colors.white
        ),
        scaffoldBackgroundColor: Color(0xff181818),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xffC6C6C6),
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            letterSpacing: 0.5,
            color: Colors.white,
          )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff15B86C),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff15B86C),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff181818),
          selectedItemColor: Color(0xff15B86C),
          unselectedItemColor: Color(0xffC6C6C6),
        ),
      ),

      home:(widget.userName==null)? WelcomeScreen():BottomNavBarWidget(),
    );
  }
}
