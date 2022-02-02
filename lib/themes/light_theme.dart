import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.yellow,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.white,
    primaryVariant: Colors.white38,
    secondary: Colors.green,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Colors.white54,
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ),
    subtitle1: TextStyle(
      color: Colors.black87
    ),
    subtitle2: TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
    bodyText2:TextStyle(
      color: Colors.black87,
    )
  ),

);