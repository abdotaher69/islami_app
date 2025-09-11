import 'package:flutter/material.dart';
import 'package:islami_app/core/extentions/context_ex.dart';
import 'package:islami_app/core/prefs_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_sura_item.dart';
import 'package:islami_app/features/models/sura_model.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => MostRecentWidgetState();
}

class MostRecentWidgetState extends State<MostRecentWidget> {
  List<SuraModel> mostRecentSuras = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMostRecent();
   
  }

  fetchMostRecent() async {
    mostRecentSuras = await PrefsManager.getMostRecentSurasIndex();
     setState(() {
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isEmpty?false:true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text(
                'most recent',
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
              itemBuilder: (context, index) =>
                  MostRecentSuraItem(suraModel: mostRecentSuras[index],mostRecentKey: widget.key as GlobalKey<MostRecentWidgetState>,),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: mostRecentSuras.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
