import 'package:islam/core/constant_data/constant_manager.dart';
import 'package:islam/core/constant_data/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late final SharedPreferences prefs;
  static const String listName = "most_recent_suras_list";

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> addSuraIndex(int suraIndex) async {
    print("suraIndex = $suraIndex ");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> surasList = prefs.getStringList(listName) ?? [];
    surasList.remove(suraIndex.toString());
    surasList.insert(0, suraIndex.toString());

    if (surasList.length > 5) {
      surasList = surasList.sublist(0, 6);
    }
    prefs.setStringList(listName, surasList);
  }

  static Future<List<SuraDM>> getMostRecentSurasList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> surasIndexes = prefs.getStringList(listName) ?? [];

    List<SuraDM> mostSurasList = [];

    for (int i = 0; i < surasIndexes.length; i++) {
      int index = int.parse(surasIndexes[i]);
      mostSurasList.add(suraList[index]);
    }

    return mostSurasList;//mostSurasList;
  }
}
