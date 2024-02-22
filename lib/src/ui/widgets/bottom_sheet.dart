import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/repository/utils/space.dart';

import '../../config/appColors.dart';
import '../../config/font_size.dart';
import '../../repository/constants/text_styles.dart';
import '../../repository/utils/app_padding.dart';
class BottomSheetHOme extends StatelessWidget {
  double h;
   BottomSheetHOme({super.key,required this.h});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dis.only(
        top: 10.h,
        lr: 15.w,
        bottom: 20.h,
      ),
      height: h,
      decoration: BoxDecoration(
        gradient: AppColors.mainGreenGradient,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Og’iz yopish duosi",
              style: AppTextStyle.instance.w700.copyWith(
                fontSize: FontSizeConst.instance.extraLargeFont,
                color: AppColors.whiteColor,
              ),
            ),
            const Divider(color: Colors.green),
            Text(
              "نَوَيْتُ أَنْ أَصُومَ صَوْمَ شَهْرَ رَمَضَانَ مِنَ الْفَجْرِ إِلَى الْمَغْرِبِ، خَالِصًا لِلهِ تَعَالَى أَللهُ أَكْبَرُ",
              style: AppTextStyle.instance.w600.copyWith(
                fontSize: FontSizeConst.instance.mediumFont,
                color: AppColors.whiteColor,
              ),
            ),
            HBox(15.h),
            Text(
              "Navaytu an asuvma sovma shahri ramazona minal fajri ilal mag‘ribi, xolisan lillahi ta’aalaa Allohu akbar.ُ",
              style: AppTextStyle.instance.w600.copyWith(
                fontSize: FontSizeConst.instance.mediumFont,
                color: AppColors.whiteColor,
              ),

            ),
            HBox(15.h),
            Text(
              "Ma’nosi: Ramazon oyining ro‘zasini subhdan to kun botguncha tutmoqni niyat qildim. Xolis Alloh uchun Alloh buyukdir.ُ",
              style: AppTextStyle.instance.w600.copyWith(
                fontSize: FontSizeConst.instance.mediumFont,
                color: AppColors.whiteColor,
              ),

            ),

          ],
        ),
      ),
    );
  }
}
