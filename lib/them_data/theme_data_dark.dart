import 'package:flutter/material.dart';
import 'package:tasky/app_color/app_color_dark.dart';

ThemeData getThemeDataDark() {
  return ThemeData(
    
    cardColor: Color(0xff282828),
    iconTheme: IconThemeData(color: AppColorDark.fontColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.appColor,

      titleTextStyle: TextStyle(
        color: AppColorDark.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: AppColorDark.fontColor,
    ),
    scaffoldBackgroundColor: AppColorDark.appColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0.5,
        color: AppColorDark.fontColor,
      ),

      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColorDark.fontColor,
      ),

      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColorDark.fontColor2,
      ),

      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColorDark.fontColor,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize :14,
        color: AppColorDark.fontColor2
      )
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColorDark.fontColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorDark.mainColor,
        foregroundColor: AppColorDark.fontColor,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorDark.mainColor,
      foregroundColor: AppColorDark.fontColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.appColor,
      selectedItemColor: AppColorDark.mainColor,
      unselectedItemColor: Color(0xffC6C6C6),
    ),
  );
}
