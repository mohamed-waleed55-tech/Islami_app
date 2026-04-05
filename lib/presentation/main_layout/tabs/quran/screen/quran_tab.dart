import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/core/constant_data/constant_manager.dart';
import 'package:islam/presentation/main_layout/tabs/quran/screen/most_recent_suras.dart';
import 'package:islam/presentation/main_layout/tabs/quran/widgets/sura_list_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  GlobalKey<MostRecentSurasState>mostRecentSurasState=GlobalKey<MostRecentSurasState>();
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
                buildTextField(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: buildTitle("Most Recently"),
                ),
                SizedBox(
                    height: 150,
                    child: MostRecentSuras(key: mostRecentSurasState,)
                ),
                buildTitle("Suras List"),
                buildSurasList(mostRecentSurasState),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget buildSurasList(GlobalKey<MostRecentSurasState> mostRecentKey) {
  return ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: suraList.length,
    itemBuilder: (_, index) =>SuraListItem(sura: suraList[index],mostRecentSurasKey:mostRecentKey ,
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

Widget buildTextField() {
  return SizedBox(
    height: 55,
    child: TextField(
      cursorColor: ColorsManager.offWhite,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorsManager.offWhite,
      ),

      decoration: InputDecoration(
        labelText: "Sura Name",

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

        filled: true,
        fillColor: ColorsManager.black.withValues(alpha: 0.3),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),

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
