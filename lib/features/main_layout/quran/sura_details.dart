import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/sura_item.dart';
import 'package:islami_app/features/main_layout/quran/verse_item.dart';
import 'package:islami_app/features/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArguments suraArguments;
  String content = '';
  List<String> suraVerses = [];
  @override
  void didChangeDependencies() {
    suraArguments =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    onItemTapped(int.parse(suraArguments.sura.index));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    suraArguments.mostRecentKey.currentState?.fetchMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.gold),
        title: Text(
          suraArguments.sura.suraNameEn,
          style: TextStyle(color: ColorsManager.gold),
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.black,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImagesAssets.leftSuraDetailsImg),
                  Image.asset("assets/images/img_right_corner.png"),
                ],
              ),
              Text(
                suraArguments.sura.suraNameAr,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.gold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: suraVerses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: suraVerses.length,
                    itemBuilder: (context, index) {
                      return VerseItem(verse: suraVerses[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void onItemTapped(int index) async {
    int realSuraIndex = index;
    print(realSuraIndex);
    String filePath = "assets/files/$realSuraIndex.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> verses = fileContent.split('\n');
    for (int i = 0; i < verses.length; i++) {
      verses[i] = verses[i].trim();
      if (verses[i].isEmpty) {
        verses.removeAt(i);
        continue;
      }
      verses[i] = "${verses[i]} \[${i + 1}\] ";
    }

    suraVerses = verses;
    // content = verses.join();
    if (mounted) {
      setState(() {});
    }
  }
}
