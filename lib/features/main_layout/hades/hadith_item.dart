import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  const HadithItem({super.key, required this.index});
  final int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
   HadithModel? hadith;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile(widget.index);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12, left: 12, top: 20),
      margin: EdgeInsets.only(bottom: 20),
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesAssets.hadithCardBackgroundImage),
          fit: BoxFit.fill,
        ),
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImagesAssets.leftSuraDetailsImg,
                    color: Colors.black,
                  ),
                  Image.asset(
                    ImagesAssets.rightSuraDetailsImg,
                    color: Colors.black,
                  ),
                ],
              ),
              hadith==null?CircularProgressIndicator(): Text(
                hadith?.title ?? "Loading...",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ],
          ),
          Expanded(
            child: hadith==null?Center(child: CircularProgressIndicator()): SingleChildScrollView(
              child: Text(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                hadith?.content ?? "Loading...",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Image.asset(ImagesAssets.hadithCardButtonImage, fit: BoxFit.fill),
        ],
      ),
    );
  }

  void loadHadithFile(int index) async {
    String filePath = 'assets/files/Hadeeth/h${index}.txt';
    String content = await rootBundle.loadString(filePath);
    List<String> hadithLines = content.trim().split('\n');
    String title = hadithLines[0];
    String hadithContent = hadithLines.sublist(1).join();
    hadith = HadithModel(title: title, content: hadithContent);
    setState(() {});
  }
}
