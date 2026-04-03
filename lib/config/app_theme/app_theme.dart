import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';

class AppTheme {
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: ColorsManager.black,
      selectedItemColor: ColorsManager.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.gold,
      selectedIconTheme: const IconThemeData(size: 40),
      unselectedIconTheme: const IconThemeData(size: 24),
      selectedLabelStyle: const TextStyle(
        fontFamily: "Amiri",
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),

      unselectedLabelStyle: const TextStyle(fontSize: 12),
    ),
    appBarTheme: AppBarThemeData(
      toolbarHeight: 30,
      backgroundColor: ColorsManager.black,
      iconTheme: IconThemeData(

          color: ColorsManager.gold,
              size: 30
        ),
      titleTextStyle: TextStyle(

        color: ColorsManager.gold,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
