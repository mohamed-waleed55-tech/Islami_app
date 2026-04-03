import 'package:islam/core/assets/images/images_manager.dart';

class OnboardingDM {
  String imagePath;
  String title;
  String? dsc;

  OnboardingDM({required this.imagePath, required this.title, this.dsc});

  static List<OnboardingDM> pageList = [
    OnboardingDM(
      imagePath: ImagesManager.onboard1,
      title: "Welcome To Islmi App",
    ),
    OnboardingDM(
      imagePath: ImagesManager.onboard2,
      title: "Welcome To Islami",
      dsc: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingDM(
      imagePath: ImagesManager.onboard3,
      title: "Reading the Quran",
      dsc: "Read, and your Lord is the Most Generous",
    ),
    OnboardingDM(
      imagePath: ImagesManager.onboard4,
      title: "Bearish",
      dsc: "Praise the name of your Lord, the Most High",
    ),
    OnboardingDM(
      imagePath: ImagesManager.onboard5,
      title: "Holy Quran Radio",
      dsc:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
