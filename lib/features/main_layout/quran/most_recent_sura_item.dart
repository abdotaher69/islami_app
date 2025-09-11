import 'package:flutter/material.dart';
import 'package:islami_app/core/prefs_manager.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_widget.dart';
import 'package:islami_app/features/main_layout/quran/sura_item.dart' show SuraDetailsArguments;
import 'package:islami_app/features/models/sura_model.dart';

import '../../../core/routes_manger/routes_manager.dart';

class MostRecentSuraItem extends StatelessWidget {
  const MostRecentSuraItem({super.key,required this.suraModel,required this.mostRecentKey});
  final SuraModel suraModel;
  final GlobalKey<MostRecentWidgetState> mostRecentKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {
        PrefsManager.addSuraIndex(suraModel.index);
        Navigator.pushNamed(context, RouteManager.suraDetails, arguments: SuraDetailsArguments(mostRecentKey: mostRecentKey, sura:suraModel));
      },

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
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
                 suraModel.suraNameEn,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
                Text(
                 suraModel.suraNameAr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
                Text(
                  "${suraModel.suraVerses} verses",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
              ],
            ),
            Image.asset(ImagesAssets.mostRecentImg),
          ],
        ),
      ),
    );
  }
}
