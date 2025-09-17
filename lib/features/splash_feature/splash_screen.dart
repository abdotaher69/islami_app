import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes_manger/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkOnBoarding();

    super.initState();
  }
  void checkOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onBoardingSeen = prefs.getBool('onBoardingSeen');
    if (onBoardingSeen != null && onBoardingSeen) {
      // User has seen the onboarding screen, navigate to main layout
      Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteManager.mainLayout);
    });
    } else {
      // User has not seen the onboarding screen, navigate to onboarding screen
      Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteManager.onBoardingScreen);
    });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Spacer(flex: 4),
              Image.asset(ImagesAssets.splashLogo),
              Spacer(flex: 6),
              Image.asset(ImagesAssets.brandingImage),
            ],
          ),
        ),
      ),
    );
  }
}
