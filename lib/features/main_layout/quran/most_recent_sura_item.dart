import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class MostRecentSuraItem extends StatelessWidget {
  const MostRecentSuraItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.symmetric(horizontal: 17,vertical: 10),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "al-fatiha",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
              Text(
                "الأنبياء",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
              Text(
                "112 verses",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
            ],
          ),
          Image.asset(ImagesAssets.mostRecentImg)
        ],
      ),
    );
  }
}
