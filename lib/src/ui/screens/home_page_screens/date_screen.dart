import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  Dis.only(tb: 5.h,lr: 13.w),
      child: Container(
        height: 72.h,
        width: 56.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorF4DEBD,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("16",style: AppTextStyle.instance.w700.copyWith(
                fontSize: FontSizeConst.instance.smallFont,
                color: AppColors.blackColor,
              ),),
              Text("She",style: AppTextStyle.instance.w400.copyWith(
                fontSize: FontSizeConst.instance.tinyFont,
                color: AppColors.blackColor,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
