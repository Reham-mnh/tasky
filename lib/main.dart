import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/database/app_database.dart';
import 'package:tasky/screens/welcome_screen.dart';
import 'package:tasky/them_data/theme_data_dark.dart';
import 'package:tasky/them_data/theme_data_light.dart';
import 'package:tasky/widgets/bottom_nav_bar_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase().database;
  final currentMode = await AdaptiveTheme.getThemeMode();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final String? userName = sharedPreferences.getString('userName');

  runApp(MyApp(userName: userName, currentMode: currentMode));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.userName, required this.currentMode});
  final String? userName;
  final AdaptiveThemeMode? currentMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: getThemeDataLight(),
      dark: getThemeDataDark(),
      initial: AdaptiveThemeMode.light,
      builder:
          (theme, darkTheme) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,

            home:
                (widget.userName == null)
                    ? WelcomeScreen()
                    : BottomNavBarWidget(),
          ),
    );
  }
}
