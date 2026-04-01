import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';
import 'package:islam/presentation/main_layout/tabs/hadith/widget/hadith_card_widget.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(ImagesManager.mohamed), context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           SizedBox(
            height: 120,
            child: Image.asset(
              ImagesManager.mohamed,
              colorBlendMode: BlendMode.srcIn,
              color: ColorsManager.gold,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child:CarouselSlider.builder(
              itemCount: 50,
              itemBuilder: (context, index, realIndex) {
                return HadithCardWidget(index: index);
              },
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
              ),
            ),
          )
        ],

      ),
    );
  }
}
