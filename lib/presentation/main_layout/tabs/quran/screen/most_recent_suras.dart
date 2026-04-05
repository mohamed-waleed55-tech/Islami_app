import 'package:flutter/material.dart';
import 'package:islam/core/navigation/routes.dart';
import 'package:islam/core/shared_prefs/prefs.dart';

import '../../../../../core/assets/colors/colors.dart';
import '../../../../../core/assets/images/images_manager.dart';
import '../../../../../core/constant_data/data_model.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => MostRecentSurasState();
}

class MostRecentSurasState extends State<MostRecentSuras> {
  List<SuraDM> recentSurasList = [];

  void getRecentSuras() async {
    recentSurasList = await PrefsManager.getMostRecentSurasList();
    print(recentSurasList);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecentSuras();
  }

  @override
  Widget build(BuildContext context) {
    return recentSurasList.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu_book, size: 60, color: ColorsManager.gold),
              SizedBox(height: 10),
              Text(
                "No Recent Suras Chosen",
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Amiri",
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentSurasList.length,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: buildRecentSuraItem(sura: recentSurasList[index]),
            ),
          );
  }

  Widget buildRecentSuraItem({required SuraDM sura}) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.quranDetails,arguments: sura);
      },
      child: Container(
        height: 150,
        width: 280,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
        ),

        child: SizedBox(
          width: 280,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sura.suraEnName,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Amiri",

                      ),
                    ),
                    Text(
                      sura.suraArName,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Amiri",

                      ),
                    ),
                    Text(
                      "${sura.verses} Verses",
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Amiri",
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Image.asset(ImagesManager.most_recent_sura, height: 120),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
