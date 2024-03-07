import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ramazon_taqvimi/src/config/router.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/pages/splash_page/time_location.dart';
import 'package:ramazon_taqvimi/src/ui/screens/settings_screens/time_settings.dart';

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
    final dayIndex=DateTime.now().day-1;
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
        title: provider.when(data: (data){
         if(data[dayIndex]!.date.month>=10||data[dayIndex]!.date.day>=10){
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "${data[dayIndex]!.date.day}.${data[dayIndex]!.date.month}.${data[dayIndex]!.date.year}",
                 style: AppTextStyle.instance.w700.copyWith(
                   fontSize: FontSizeConst.instance.largeFont,
                   color: AppColors.whiteColor,
                 ),
               ),
               Text("${data[dayIndex]!.hijriyKun} ${data[dayIndex]!.hijriyOy}",style: AppTextStyle.instance.w600.copyWith(
                 fontSize: FontSizeConst.instance.smallFont,
                 color: AppColors.whiteColor,
               ),),
             ],
           );
         }else{
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "0${data[dayIndex]!.date.day}.0${data[dayIndex]!.date.month} ${data[dayIndex]!.date.year}",
                 style: AppTextStyle.instance.w700.copyWith(
                   fontSize: FontSizeConst.instance.largeFont,
                   color: AppColors.whiteColor,
                 ),
               ),
               Text("${data[dayIndex]!.hijriyKun} ${data[dayIndex]!.hijriyOy}",style: AppTextStyle.instance.w600.copyWith(
                 fontSize: FontSizeConst.instance.smallFont,
                 color: AppColors.whiteColor,
               ),),
             ],
           );
         };
        },
            error: (error,st){
          return Text(error.toString());
          // log(error.toString());
        }, loading: (){
          log('Waiting');
        }),
        actions: [
          TextButton(onPressed: (){
            AppRouter.go(context, const TimeSettings());
          }, child: Text(TimeLocation.controller.text,style: AppTextStyle.instance.w700.copyWith(
            fontSize: FontSizeConst.instance.largeFont,
            color: AppColors.whiteColor
          ),))
        ],
      ),
    );
  }
}
