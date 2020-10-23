import 'package:flutter/material.dart';
import 'package:weight_app/appTheme/theme.dart';
import 'package:weight_app/appUI/home.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider<AppThemeNotifier>(
      create: (_) => AppThemeNotifier(),
      child: new MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (_, appTheme, child) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weight App Calculater",
        home: new WeightCal(),
        theme: AppThemeNotifier.lightTheme(),
        darkTheme: AppThemeNotifier.darkTheme(),
        themeMode: (appTheme.darkModeEnabled == true &&
                appTheme.lightModeEnabled == false)
            ? ThemeMode.dark
            : (appTheme.darkModeEnabled == false &&
                    appTheme.lightModeEnabled == true)
                ? ThemeMode.light
                : ThemeMode.system,
      );
    });
  }
}
