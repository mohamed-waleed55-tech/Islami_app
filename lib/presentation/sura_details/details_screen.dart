import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/core/constant_data/data_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraDM arguments;

  String suraContent = "";
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as SuraDM;

    loadSura();
  }


  @override
  void dispose() {
    arguments.recentSurasKey?.currentState?.getRecentSuras();
    super.dispose();
  }

  Future<void> loadSura() async {
    String content = await rootBundle.loadString(
      "lib/core/assets/files/suras/${arguments.suraNum}.txt",
    );


    List<String> verses = content.split("\n");
    for (int i = 0; i < verses.length; i++) {
      if (verses[i].trim().isEmpty) continue;
      suraContent += "${verses[i]} (${i + 1}) ";
    }

    isLoading = false;
    await Future.delayed(const Duration(milliseconds: 500)); // delay

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(arguments.suraEnName),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 62,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImagesManager.details_left_corner),
                    Image.asset(ImagesManager.details_right_corner),
                  ],
                ),
                Text(
                  arguments.suraArName,
                  style: TextStyle(
                    color: ColorsManager.gold,
                    fontSize: 24,
                    fontFamily: "Amiri",
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Text(
                suraContent,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  height: 2,
                  fontFamily: "Amiri",
                  color: ColorsManager.gold
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
              child: Image.asset(ImagesManager.bottom_decoration,height: 100,
                ))
        ],
      ),
    );
  }
}