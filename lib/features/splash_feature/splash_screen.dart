import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

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
    navigateToMainLayout();

    super.initState();
  }

  void navigateToMainLayout() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteManager.mainLayout);
    });  }

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
