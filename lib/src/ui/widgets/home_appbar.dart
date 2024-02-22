import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ramazon_taqvimi/src/config/router.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/screens/home_page_screens/notification.dart';

import '../../config/appColors.dart';
import '../../config/font_size.dart';
import '../../repository/constants/text_styles.dart';
import '../../repository/utils/app_padding.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: Dis.only(lr: 8.w, top: 40.h),
      decoration: BoxDecoration(
        color: AppColors.mainGreen,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1 Ramazon 1444 Hijira",
              style: AppTextStyle.instance.w600.copyWith(
                fontSize: FontSizeConst.instance.mediumFont,
                color: AppColors.whiteColor,
              ),
            ),
            Text(
              "Juma, 11 mart 2023",
              style: AppTextStyle.instance.w600.copyWith(
                fontSize: FontSizeConst.instance.extraSmallFont,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppRouter.go(context, const NotificationScreen());
            },
            icon: SvgPicture.asset(
              'assets/svg/BellOutline.svg',
              height: 24.h,
              width: 24.w,
            ),
          )
        ],
      ),
    );
  }
}
