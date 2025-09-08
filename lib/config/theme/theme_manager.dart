import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class ThemeManager{
  static final ThemeData light =ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.gold,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.black,
        elevation: 0,
        type: BottomNavigationBarType.fixed,


      )
  );
  static final ThemeData dark =ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.gold,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.black,
        elevation: 0,
        type: BottomNavigationBarType.fixed,


      )
  );
}
