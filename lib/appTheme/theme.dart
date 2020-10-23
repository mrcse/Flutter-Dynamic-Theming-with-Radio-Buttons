import 'package:flutter/material.dart';

class AppThemeNotifier extends ChangeNotifier {
  AppThemeNotifier();
  bool _isDarkMode;
  bool _isLightMode;

  set darkMode(dark) {
    this._isDarkMode = dark;

    notifyListeners();
  }

  set lightMode(light) {
    this._isLightMode = light;

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
