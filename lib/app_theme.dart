import 'package:flutter/material.dart';

class AppTheme {
  static const Color Primary = Color(0xff5D9CEC);
  static const Color backgroundLight = Color(0xffDFECDB);
  static const Color backgroundDark = Color(0xff1E1E1E);
  static const Color black = Color(0xff363636);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey = Color(0xffC8C9CB);
  static const Color green = Color(0xff61E757);
  static const Color red = Color(0xffEC4B4B);

  static ThemeData LightTheme = ThemeData(
    primaryColor: Primary,
    scaffoldBackgroundColor: backgroundLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: Primary,
      unselectedItemColor: grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Primary,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(
          width: 4,
          color: white,
        ),
      ),
    ),
  );
  static ThemeData DarkTheme = ThemeData();
}
