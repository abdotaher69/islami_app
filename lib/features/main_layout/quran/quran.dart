import 'package:flutter/material.dart';
import 'package:islami_app/core/extentions/context_ex.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/sura_item.dart';
import 'package:islami_app/features/models/sura_model.dart';

import '../../../core/resources/assets_manager.dart';
import 'most_recent_sura_item.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SuraModel> searchedList = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(ImagesAssets.islamiLogo),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                searchedList.clear();
                searchedList = SuraModel.suras
                    .where(
                      (element) =>
                          element.suraNameEn.toLowerCase().contains(value)||element.suraNameAr.toLowerCase().contains(value),
                    )
                    .toList();
                print(searchedList[0]);
                setState(() {});
              },
              cursorColor: ColorsManager.gold,
              style: TextStyle(
                color: ColorsManager.gold,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                prefixIcon: ImageIcon(AssetImage(IconAssets.quran)),
                prefixIconColor: ColorsManager.gold,
                labelText: 'Sura name',
                labelStyle: TextStyle(
                  color: ColorsManager.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorsManager.gold),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorsManager.gold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sura name',
              style: TextStyle(
                color: ColorsManager.ofWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: context.getHeight * 0.18,
              child: ListView.separated(
                itemBuilder: (context, index) => MostRecentSuraItem(),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sura List',
              style: TextStyle(
                color: ColorsManager.ofWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SuraItem(
                sura: searchedList.isEmpty
                    ? SuraModel.suras[index]
                    : searchedList[index],
              ),
              separatorBuilder: (context, index) =>
                  Divider(endIndent: 20, indent: 20),
              itemCount: searchedList.isEmpty
                  ? SuraModel.suras.length
                  : searchedList.length,
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
