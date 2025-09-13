import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/controller/cubit/theme/theme_cubit.dart';
import 'package:tasky/controller/cubit/task_cubit.dart';
import 'package:tasky/models/task.dart';
import 'package:tasky/screens/welcome_screen.dart';
import 'package:tasky/them_data/theme_data_dark.dart';
import 'package:tasky/them_data/theme_data_light.dart';
import 'package:tasky/widgets/bottom_nav_bar_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  // await AppDatabase().database;
  final currentMode = await AdaptiveTheme.getThemeMode();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final String? userName = sharedPreferences.getString('userName');

  runApp(
     MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => TaskCubit()),
      BlocProvider(create: (_) => ThemeCubit()), 
    ],
    
     
      child: MyApp(userName: userName,),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.userName,});
  final String? userName;
//  final AdaptiveThemeMode? currentMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
    //  AdaptiveTheme(
    //   light: getThemeDataLight(),
    //   dark: getThemeDataDark(),
    //   initial: AdaptiveThemeMode.light,
    //   builder:
    //       (theme, darkTheme) =>
    BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: getThemeDataLight(),
          darkTheme: getThemeDataDark(),

          home:
              (widget.userName == null)
                  ? WelcomeScreen()
                  : BottomNavBarWidget(),
        );
      },
    );
  }
}
