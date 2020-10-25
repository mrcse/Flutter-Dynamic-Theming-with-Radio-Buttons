
import 'package:flutter/material.dart';



class AppTheme{
  static final AppTheme _instance = new AppTheme.internal();
  factory AppTheme() => _instance;
  AppTheme.internal();

  static ThemeData lightTheme() {
    return new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade100);
  }

  static ThemeData darkTheme() {
    return new ThemeData(
        appBarTheme: new AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.white);
  }

}
