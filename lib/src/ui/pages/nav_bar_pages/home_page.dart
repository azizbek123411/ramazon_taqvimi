import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';

import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/repository/utils/space.dart';
import 'package:ramazon_taqvimi/src/ui/screens/home_page_screens/date_screen.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/bottom_sheet.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/main_green_button.dart';

import '../../../repository/providers/times_provider.dart';
import '../../widgets/home_appbar.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(namozTimes);
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110.h),
        child: const HomeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dis.only(lr: 20.w),
          child: provider.when(data: (data) {
            return Column(
              children: [
                HBox(13.h),
                SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return DateTime.now().day != data[index]!.date.day
                            ? DateScreen(
                                weekday: data[index]!.weekday,
                                day: data[index]!.date.day.toString(),
                              )
                            : MainGreenButton(
                                h: 72.h,
                                w: 106.w,
                                radius: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data[index]!.date.day.toString(),
                                      style: AppTextStyle.instance.w700
                                          .copyWith(
                                              fontSize: FontSizeConst
                                                  .instance.largeFont,
                                              color: AppColors.whiteColor),
                                    ),
                                    Text(
                                      data[index]!.weekday,
                                      style: AppTextStyle.instance.w700
                                          .copyWith(
                                              fontSize: FontSizeConst
                                                  .instance.extraSmallFont,
                                              color: AppColors.whiteColor),
                                    ),
                                  ],
                                ),
                                onTap: () {});
                      }),
                ),
                HBox(16.h),
                Container(
                  padding: Dis.only(tb: 16.h),
                  height: 490.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorF4DEBD,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "ramadan_month",
                        style: AppTextStyle.instance.w700.copyWith(
                            fontSize: FontSizeConst.instance.extraLargeFont,
                            color: AppColors.blackColor),
                      ).tr(),
                      Padding(
                        padding: Dis.only(tb: 14.h),
                        child: CircularPercentIndicator(
                          linearGradient: AppColors.mainGreenGradient,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "for_open_mouth",
                                style: AppTextStyle.instance.w400.copyWith(
                                    fontSize: FontSizeConst.instance.mediumFont,
                                    color: AppColors.blackColor),
                              ).tr(),
                              Text(
                                "08:00:25",
                                style: AppTextStyle.instance.w700.copyWith(
                                    fontSize:
                                        FontSizeConst.instance.extraLargeFont,
                                    color: AppColors.blackColor),
                              ),
                            ],
                          ),
                          radius: 150,
                          lineWidth: 30,
                          percent: 0.2,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Colors.green.shade200,
                        ),
                      ),
                      HBox(20.h),
                  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         MainGreenButton(
                           onTap: () {
                             showModalBottomSheet(
                                 context: context,
                                 builder: (BuildContext context) {
                                   return BottomSheetHOme(
                                     h: 400.h,
                                     whichPray: 'close_mouth_pray'.tr(),
                                     arabicPray:
                                         'اَللَّهُمَّ لَكَ صُمْتُ وَ بِكَ آمَنْتُ وَ عَلَيْكَ تَوَكَّلْتُ وَ عَلَى رِزْقِكَ أَفْتَرْتُ، فَغْفِرْلِى مَا قَدَّمْتُ وَ مَا أَخَّرْتُ بِرَحْمَتِكَ يَا أَرْحَمَ الرَّاحِمِينَ',
                                     latinPray: 'open_mouth_pray_latin'.tr(),
                                     meaningPray: 'open_mouth_pray_meaning'.tr(),
                                   );
                                 });
                           },
                           h: 70.h,
                           w: 150.w,
                           radius: 8,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text(
                                 data[1]!.saharlik,
                                 style: AppTextStyle.instance.w700.copyWith(
                                     fontSize:
                                     FontSizeConst.instance.mediumFont,
                                     color: AppColors.whiteColor),
                               ),
                               Text(
                                 "close_mouth_pray",
                                 style: AppTextStyle.instance.w700.copyWith(
                                   fontSize: FontSizeConst.instance.smallFont,
                                   color: AppColors.whiteColor,
                                 ),
                               ).tr()
                             ],
                           ),
                         ),
                         MainGreenButton(
                           onTap: () {
                             showModalBottomSheet(
                               context: context,
                               builder: (BuildContext context) {
                                 return BottomSheetHOme(
                                   h: 400.h,
                                   whichPray: 'open_mouth_pray'.tr(),
                                   arabicPray:
                                       'نَوَيْتُ أَنْ أَصُومَ صَوْمَ شَهْرَ رَمَضَانَ مِنَ الْفَجْرِ إِلَى الْمَغْرِبِ، خَالِصًا لِلهِ تَعَالَى أَللهُ أَكْبَرُ',
                                   latinPray: 'close_mouth_pray_latin'.tr(),
                                   meaningPray: 'close_mouth_pray_meaning'.tr(),
                                 );
                               },
                             );
                           },
                           h: 70.h,
                           w: 150.w,
                           radius: 8,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text(
                                 data[1]!.xufton,
                                 style: AppTextStyle.instance.w700.copyWith(
                                     fontSize:
                                     FontSizeConst.instance.mediumFont,
                                     color: AppColors.whiteColor),
                               ),
                               Text(
                                 "open_mouth_pray".tr(),
                                 style: AppTextStyle.instance.w700.copyWith(
                                   fontSize: FontSizeConst.instance.smallFont,
                                   color: AppColors.whiteColor,
                                 ),
                               )
                             ],
                           ),
                         ),
                       ],
                     )
                    ],
                  ),
                )
              ],
            );
          }, error: (error, st) {
            return Center(
              child: Text(
                error.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
//Column(
//             children: [
//               Container(
//         child: Column(
//                   children: [
//
//                   ],
//                 ),
//               )
//             ],
//           )

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
