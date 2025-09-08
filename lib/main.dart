import 'package:flutter/material.dart';

import 'config/theme/theme_manager.dart';
import 'core/resources/colors_manager.dart';
import 'core/routes_manger/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,

      routes: RouteManager.routes,
      initialRoute:RouteManager.splashScreen,
    );
  }
  }
