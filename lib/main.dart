import 'package:flutter/material.dart';
import 'package:weight_app/appUI/home.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:weight_app/appTheme/theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme(),
      dark: AppTheme.darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weight App Calculater",
        theme: theme,
        darkTheme: darkTheme,
        home: WeightCal(),
      ),
    );
  }
}
