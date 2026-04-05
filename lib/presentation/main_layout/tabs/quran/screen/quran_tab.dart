import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/core/constant_data/constant_manager.dart';
import 'package:islam/presentation/main_layout/tabs/quran/screen/most_recent_suras.dart';
import 'package:islam/presentation/main_layout/tabs/quran/widgets/sura_list_item.dart';

import '../../../../../core/constant_data/data_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDM> filteredSuras = [];
  TextEditingController searchController = TextEditingController();

  GlobalKey<MostRecentSurasState> mostRecentSurasState =
      GlobalKey<MostRecentSurasState>();

  @override
  void initState() {
    super.initState();
    filteredSuras = suraList;
  }

  void searchSura(String query) {
    if (query.isEmpty) {
      filteredSuras = suraList;
    } else {
      filteredSuras = suraList.where((sura) {
        return sura.suraArName.contains(query) ||
            sura.suraEnName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsManager.black,
        width: double.infinity,
        height: double.infinity,
        // decoration:const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(ImagesManager.quran_bg),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 66, vertical: 26),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(ImagesManager.quran_header),
                ),
                buildTextField(searchSura, searchController),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: buildTitle("Most Recently"),
                ),
                SizedBox(
                  height: 150,
                  child: MostRecentSuras(key: mostRecentSurasState),
                ),
                buildTitle("Suras List"),
                buildSurasList(mostRecentSurasState, filteredSuras),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSurasList(
  GlobalKey<MostRecentSurasState> mostRecentKey,
  List<SuraDM> filteredSuras,
) {
  return ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: filteredSuras.length,
    // 🔥 هنا
    itemBuilder: (_, index) => SuraListItem(
      sura: filteredSuras[index], // 🔥 هنا
      mostRecentSurasKey: mostRecentKey,
    ),
    separatorBuilder: (_, _) => Divider(
      endIndent: 64,
      indent: 64,
      color: ColorsManager.offWhite,
      height: 1,
      thickness: 1,
    ),
  );
}

Widget buildTextField(
  Function(String) onChanged,
  TextEditingController searchController,
) {
  return SizedBox(
    height: 55,
    child: TextField(

      controller: searchController,
      onChanged: onChanged,

      cursorColor: ColorsManager.offWhite,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorsManager.offWhite,
      ),

      decoration: InputDecoration(
        labelText: "Sura Name",
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),

        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorsManager.offWhite,
        ),

        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: const ImageIcon(
            AssetImage(ImagesManager.quran),
            color: ColorsManager.gold,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, color: ColorsManager.gold),
          onPressed: () {
            searchController.clear();
            onChanged("");
          },
        ),

        filled: true,
        fillColor: ColorsManager.black.withValues(alpha: 0.3),



        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsManager.gold, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsManager.gold, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    ),
  );
}

Widget buildTitle(String title) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: TextStyle(
        color: ColorsManager.offWhite,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
