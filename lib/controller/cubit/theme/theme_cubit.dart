import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme();
  }
  void _loadTheme() async {
    final box = await Hive.openBox('themeBox');
    final isDark = box.get('isDark', defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void selectedTheme() async {
    final isDark = state == ThemeMode.dark;
    final box = await Hive.openBox('themeBox');
    await box.put('isDark', !isDark);
    emit((!isDark ? ThemeMode.dark : ThemeMode.light));
  }
}
