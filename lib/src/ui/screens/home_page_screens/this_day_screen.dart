import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/repository/utils/space.dart';

class ThisDayScreen extends StatelessWidget {
  String day;
  String weekday;

  ThisDayScreen({super.key, required this.weekday, required this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dis.only(tb: 4.h, lr: 13.w),
      child: Container(
        margin: Dis.only(top: 10.h),
        height: 80.h,
        width: 106.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: AppColors.mainGreenGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                day,
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.smallFont,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                weekday,
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.tinyFont,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
