import 'package:flutter/material.dart';
import 'package:islam/core/constant_data/data_model.dart';
import 'package:islam/core/navigation/routes.dart';
import '../../../../../core/assets/colors/colors.dart';
import '../../../../../core/assets/images/images_manager.dart';

class SuraListItem extends StatelessWidget {
   const SuraListItem({super.key,required this.sura});
 final SuraDM sura;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.quranDetails,arguments: sura);
      },
      child: SizedBox(
        height: 64,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  ImagesManager.sura_num_bg,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Text(
                 "${sura.suraNum}",
                  style: TextStyle(
                    color: ColorsManager.offWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 20),

            // الاسم الإنجليزي وعدد الآيات
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
              sura.suraEnName,
                style: TextStyle(
                      color: ColorsManager.offWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${sura.verses} Verses",
                    style: TextStyle(
                      color: ColorsManager.offWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Text(sura.suraArName,
              style: TextStyle(
                color: ColorsManager.offWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}