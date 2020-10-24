import 'package:flutter/material.dart';

class AppThemeNotifier extends ChangeNotifier {
  AppThemeNotifier();
  static bool _isDarkMode = false;
  static bool _isLightMode = false;

  set darkMode(dark) {
    _isDarkMode = dark;

    notifyListeners();
  }

  set lightMode(light) {
    _isLightMode = light;

    notifyListeners();
  }

  get darkModeEnabled => _isDarkMode;
  get lightModeEnabled => _isLightMode;

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
