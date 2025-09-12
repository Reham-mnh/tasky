import 'package:flutter/material.dart';
import 'package:tasky/app_color/app_color_light.dart';

ThemeData getThemeDataLight() {
  return ThemeData(
    cardColor: Colors.white,

    primaryColor: Colors.white,

    iconTheme: IconThemeData(color: AppColorLight.fontColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorLight.backgroundColor,
      iconTheme: IconThemeData(color: AppColorLight.fontColor),
      titleTextStyle: TextStyle(
        color: AppColorLight.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: AppColorLight.fontColor,
    ),
    scaffoldBackgroundColor: AppColorLight.backgroundColor,

    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),

      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColorLight.fontColor,
      ),

      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColorLight.fontColor2,
      ),

      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),

      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize :14,
        color: AppColorLight.fontColor2
      )
    ),

    

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorLight.mainColor,
        foregroundColor: AppColorLight.fontColor,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorLight.mainColor,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorLight.backgroundColor,
      selectedItemColor: AppColorLight.mainColor,
      unselectedItemColor: Color(0xffC6C6C6),
    ),
  );
}
