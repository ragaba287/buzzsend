import 'package:flutter/material.dart';
import '../../config.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: accentColor,
    primaryVariant: accentColor,
    secondary: Color(0xff545DBB),
    secondaryVariant: accentColor,
    surface: accentColor,
    background: accentColor,
    brightness: Brightness.dark,
    error: accentColor,
    onBackground: accentColor,
    onError: accentColor,
    onPrimary: accentColor,
    onSecondary: accentColor,
    onSurface: accentColor,
  ),
  fontFamily: fontFamily,
  scaffoldBackgroundColor: Color(0xff1B1E3C),
  brightness: Brightness.dark,
  primaryColor: accentColor,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: accentColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    headline3: TextStyle(
      fontSize: 50,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 18,
      height: 1.3,
      fontWeight: FontWeight.w500,
    ),
  ),
);
