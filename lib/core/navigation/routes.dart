import 'package:flutter/material.dart';
import 'package:islam/presentation/hadith_details/hadith_details.dart';
import 'package:islam/presentation/onboarding/onboarding.dart';
import 'package:islam/presentation/splash/splash_screen.dart';
import 'package:islam/presentation/sura_details/details_screen.dart';

import '../../presentation/main_layout/home_screen/home_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String home = "/main_layout";
  static const String quranDetails = "/details";
  static const String onboarding= "/onboarding";
  static const String hadithDetails = "/hadithDetails";


  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const Splashscreen(),
    home: (_) => const HomeScreen(),
    quranDetails:(_)=>const SuraDetailsScreen(),
    hadithDetails:(_)=>const HadithDetails(),
    onboarding:(_)=>const OnBoardingScreen(),
  };
}
