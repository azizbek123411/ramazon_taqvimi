import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';

import '../../../config/appColors.dart';
import '../../../config/font_size.dart';
import '../../../config/router.dart';
import '../../../repository/constants/text_styles.dart';
import '../../../repository/utils/space.dart';
class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainGreen,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          )),
      backgroundColor: AppColors.mainBackground,
      body: Padding(
        padding: Dis.only(lr: 20.w,
        tb: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: IconButton(
                    onPressed: () {
                      AppRouter.close(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.mainGreen,
                    ),
                  ),
                ),
                WBox(10.w),
                Text(
                  "Vaqt sozlamasi",
                  style: AppTextStyle.instance.w700.copyWith(
                      fontSize: FontSizeConst.instance.extraLargeFont,
                      color: AppColors.mainGreen),
                )
              ],
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.radio_button_checked_sharp,
                    color: AppColors.blackColor),
              ),
              title: Text(
                "O'zbekcha (UZ)",
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.mediumFont,
                  color: AppColors.blackColor,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/uzbekistan-flag-round-circle-icon.svg",
                height: 32.h,
                width: 32.w,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.radio_button_checked_sharp,
                  color: AppColors.blackColor,
                ),
              ),
              title: Text(
                "Русский   (RU)",
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.mediumFont,
                  color: AppColors.blackColor,
                ),
              ),
              trailing: SvgPicture.asset(
                  "assets/svg/russia-flag-round-circle-icon.svg",
                  height: 32.h,
                  width: 32.w),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.radio_button_checked_sharp,
                    color: AppColors.blackColor),
              ),
              title: Text(
                "English (US)",
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.mediumFont,
                  color: AppColors.blackColor,
                ),
              ),
              trailing: SvgPicture.asset(
                  "assets/svg/usa-flag-round-circle-icon.svg",
                  height: 32.h,
                  width: 32.w),
            ),
          ],
        ),
      ),
    );
  }
}
