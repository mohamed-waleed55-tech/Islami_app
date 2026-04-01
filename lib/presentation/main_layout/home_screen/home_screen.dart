import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/presentation/main_layout/tabs/hadith/hadith_tab.dart';
import 'package:islam/presentation/main_layout/tabs/quran/screen/quran_tab.dart';
import 'package:islam/presentation/main_layout/tabs/radio/radio_tab.dart';
import 'package:islam/presentation/main_layout/tabs/tasbih/tasbih_tab.dart';
import 'package:islam/presentation/main_layout/tabs/times/times_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbihTab(),
    RadioTab(),
    TimesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  Widget buildSelectedTabBackground({
    required String imagePath,
    required bool isSelected,
  }) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: ColorsManager.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage(imagePath)),
          )
        : ImageIcon(AssetImage(imagePath));
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (tabbedIndex) {
        currentIndex = tabbedIndex;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: buildSelectedTabBackground(

            imagePath: ImagesManager.quran,
            isSelected: currentIndex == 0,
          ),
          //active Icon
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildSelectedTabBackground(
            imagePath: ImagesManager.suna,
            isSelected: currentIndex == 1,
          ),
          label: "Hadith",
        ),
        BottomNavigationBarItem(
          icon: buildSelectedTabBackground(
            imagePath: ImagesManager.tasbih,
            isSelected: currentIndex == 2,
          ),
          label: "Tasbih",
        ),
        BottomNavigationBarItem(
          icon: buildSelectedTabBackground(
            imagePath: ImagesManager.radio,
            isSelected: currentIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildSelectedTabBackground(
            imagePath: ImagesManager.salah,
            isSelected: currentIndex == 4,
          ),
          label: "Times",
        ),
      ],
    );
  }
}
