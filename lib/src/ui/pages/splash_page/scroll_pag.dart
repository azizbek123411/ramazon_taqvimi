import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/config/router.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/main_green_button.dart';

import '../../../config/appColors.dart';
import '../nav_bar_pages/main_nav_page.dart';

class ScrollPage extends StatefulWidget {
  static const String id = 'scroll';

  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Dis.only(lr: 20.w, tb: 15.h),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/image2.png"),
                fit: BoxFit.cover),
            color: AppColors.mainBackground),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage("assets/images/ramadan.png"),
            ),
            Text(
              "Muqaddas Ramazon oyi ",
              style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.extraLargeFont,
                  color: AppColors.mainGreen),
            ),
            Text(
              "“Ramazon oyi – odamlar uchun hidoyat (manbai) va to‘g‘ri yo‘l hamda ajrim etuvchi hujjatlardan iborat Qur'on nozil qilingan oydir ",
              style: AppTextStyle.instance.w500.copyWith(
                  fontSize: FontSizeConst.instance.mediumFont,
                  color: AppColors.mainGreen),
            ),
            MainGreenButton(
                h: 48,
                w: double.infinity,
                radius: 8,
                child: Center(child: Text("Boshlash",style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.mediumFont,
                  color: AppColors.whiteColor
                ),)),
                onTap: () {
                  AppRouter.id(context, MainNavpage.id);
                })
          ],
        ),
      ),
    );
  }
}
