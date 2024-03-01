import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ramazon_taqvimi/src/config/router.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/screens/home_page_screens/notification.dart';

import '../../config/appColors.dart';
import '../../config/font_size.dart';
import '../../repository/constants/text_styles.dart';
import '../../repository/providers/times_provider.dart';
import '../../repository/utils/app_padding.dart';
class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final provider = ref.watch(namozTimes);
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
            provider.when(data: (data){
              return Text(
                "${data!.date}",
                style: AppTextStyle.instance.w600.copyWith(
                  fontSize: FontSizeConst.instance.mediumFont,
                  color: AppColors.whiteColor,
                ),
              );
            },
                error: (error,st){
              return Text(error.toString());
              // log(error.toString());
            }, loading: (){
              return const CircularProgressIndicator();
            }),
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
