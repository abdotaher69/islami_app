import 'package:islami_app/features/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<void> addSuraIndex(String index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        pref.getStringList('most_recent_suras_Index') ?? [];
    if (mostRecentSurasIndex.contains(index)) {
      mostRecentSurasIndex.remove(index);
    }
    if (mostRecentSurasIndex.length > 3) {
      print(mostRecentSurasIndex.length);
      mostRecentSurasIndex.remove(mostRecentSurasIndex.last);
      print(mostRecentSurasIndex.length);
      print("888888888888888888888888888888888888888888888888");
    }
    mostRecentSurasIndex.add(index);
    pref.setStringList('most_recent_suras_Index', mostRecentSurasIndex);
  }

  static Future<List<SuraModel>> getMostRecentSurasIndex() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        pref.getStringList('most_recent_suras_Index') ?? [];
    List<SuraModel> mostRecent = [];
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int index = int.parse(mostRecentSurasIndex[i]);
      mostRecent.add(SuraModel.suras[index - 1]);
    }
    return mostRecent.reversed.toList();
  }
}
