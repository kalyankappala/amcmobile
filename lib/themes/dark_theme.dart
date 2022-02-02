import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.black,
    primaryVariant: Colors.black,
    secondary: Colors.red,
  ),
  cardTheme: CardTheme(
    color: Colors.black,
  ),
  iconTheme: IconThemeData(
    color: Colors.white54,
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ),
    subtitle2: TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  ),
);