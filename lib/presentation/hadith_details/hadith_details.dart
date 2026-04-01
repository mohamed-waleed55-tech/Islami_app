import 'package:flutter/material.dart';
import 'package:islam/presentation/main_layout/tabs/hadith/model/data_model.dart';

import '../../core/assets/colors/colors.dart';
import '../../core/assets/images/images_manager.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  late HadithDM arguments;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as HadithDM;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true),
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
                  arguments.title,
                  style: TextStyle(
                    color: ColorsManager.gold,
                    fontSize: 24,
                    fontFamily: "Amiri",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(6),
                child: Text(
                  arguments.content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    height: 2,
                    fontFamily: "Amiri",
                    color: ColorsManager.gold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(ImagesManager.bottom_decoration, height: 100),
          ),
        ],
      ),
    );
  }
}
