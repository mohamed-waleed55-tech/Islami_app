import 'package:flutter/material.dart';

import '../../../../../core/assets/colors/colors.dart';
import '../../../../../core/assets/images/images_manager.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 280,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),

      child: SizedBox(
        width: 280,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Al-Anbiya",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "الأنبياء",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "112 Verses",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 10),

            Image.asset(ImagesManager.most_recent_sura, height: 120),
          ],
        ),
      ),
    );
  }
}
