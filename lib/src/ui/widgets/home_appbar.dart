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
             if(data[0]!.date.month>=10){
               return Text(
                 "${data[0]!.date.day}.${data[0]!.date.month}.${data[0]!.date.year}",
                 style: AppTextStyle.instance.w700.copyWith(
                   fontSize: FontSizeConst.instance.largeFont,
                   color: AppColors.whiteColor,
                 ),
               );
             }else{
               return Text(
                 "${data[2]!.date.day}}",
                 style: AppTextStyle.instance.w700.copyWith(
                   fontSize: FontSizeConst.instance.largeFont,
                   color: AppColors.whiteColor,
                 ),
               );
             };
            },
                error: (error,st){
              return Text(error.toString());
              // log(error.toString());
            }, loading: (){
              return const CircularProgressIndicator();
            }),
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
