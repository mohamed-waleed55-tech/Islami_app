import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/core/constant_data/onboarding.dart';
import 'package:islam/core/navigation/routes.dart';
import 'package:islam/presentation/onboarding/widgets/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPageIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(ImagesManager.quran_header, width: 291, height: 171),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPageIndex = value;
                  });
                },
                itemCount: OnboardingDM.pageList.length,
                itemBuilder: (context, index) {
                  return OnBoardingItem(model: OnboardingDM.pageList[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      currentPageIndex == 0
                          ? Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.home,
                            )
                          : controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                    },
                    child: Text(
                            currentPageIndex == 0 ? "Skip" : "Back",
                            style: const TextStyle(
                              color: ColorsManager.gold,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  DotsIndicator(
                    dotsCount: OnboardingDM.pageList.length,
                    position: currentPageIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: ColorsManager.gold,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      currentPageIndex == 4
                          ? Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.home,
                            )
                          : controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                    },
                    child: Text(
                      currentPageIndex == 4 ? "Finish" : "Next",
                      style: const TextStyle(
                        color: ColorsManager.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
