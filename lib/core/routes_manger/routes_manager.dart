import 'package:flutter/cupertino.dart';
import 'package:islami_app/features/main_layout/quran/sura_details.dart';

import '../../features/main_layout/main_layout.dart';
import '../../features/splash_feature/splash_screen.dart';

class RouteManager {
  static const String splashScreen = 'splash_screen';
  static const String onBoarding = 'onBoarding';
  static const String suraDetails = 'suraDetails';
  static const String mainLayout = 'mainLayout';


  static Map<String,WidgetBuilder>routes={
    splashScreen:(context)=>SplashScreen(),
    onBoarding:(context)=>SplashScreen(),
    mainLayout:(context)=>MainLayout(),
    suraDetails:(context)=>SuraDetails()


  };




}