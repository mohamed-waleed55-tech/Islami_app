import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/navigation/routes.dart';
import 'package:islam/presentation/main_layout/tabs/hadith/model/data_model.dart';

import '../../../../../core/assets/images/images_manager.dart';

class HadithCardWidget extends StatefulWidget {
  const HadithCardWidget({super.key, required this.index});

  final int index;

  @override
  State<HadithCardWidget> createState() => _HadithCardWidgetState();
}

class _HadithCardWidgetState extends State<HadithCardWidget> {
  HadithDM? hadith;

  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: hadith == null
          ? null
          : () {
              Navigator.pushNamed(
                context,
                AppRoutes.hadithDetails,
                arguments: hadith,
              );
            },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.gold,
          ),

          child: hadith == null
              ? Center(child: const CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                ImagesManager.details_left_corner,
                                color: ColorsManager.black,
                                colorBlendMode: BlendMode.srcIn,
                              ),
                              Image.asset(
                                ImagesManager.details_right_corner,
                                color: ColorsManager.black,
                                colorBlendMode: BlendMode.srcIn,
                              ),
                            ],
                          ),
                          Text(
                            hadith!.title,
                            style: const TextStyle(
                              color: ColorsManager.black,
                              fontSize: 24,
                              fontFamily: "Amiri",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Divider(color: ColorsManager.black),

                    /// 🔹 Content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          hadith!.content,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontFamily: "Amiri",
                            color: ColorsManager.black,
                            fontSize: 18,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void loadHadithFile() async {
    String content = await rootBundle.loadString(
      "lib/core/assets/files/hadith/h${widget.index + 1}.txt",
    );
    String title = content.substring(0, content.indexOf("\n"));
    String hadithContent = content.substring(content.indexOf("\n") + 1);
    setState(() {
      hadith = HadithDM(title, hadithContent);
    });
  }
}
