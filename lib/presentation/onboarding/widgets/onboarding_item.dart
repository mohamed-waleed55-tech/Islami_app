import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/core/constant_data/onboarding.dart';

class OnBoardingItem extends StatelessWidget {
  OnBoardingItem({super.key, required this.model});

  OnboardingDM model;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(model.imagePath,width: 398,height: 415,),
          Text(
            model.title,
            style: TextStyle(
              color: ColorsManager.gold,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          model.dsc==null ?SizedBox(width: 10,):
          Text(
            model.dsc ?? " ",
            style: TextStyle(
              color: ColorsManager.gold,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
