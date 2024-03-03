import 'dart:developer';

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
import 'package:ramazon_taqvimi/src/ui/screens/home_page_screens/this_day_screen.dart';
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
          child: Column(
            children: [
              HBox(20.h),
              SizedBox(
                height: 80.h,
                child: provider.when(data: (data) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        log(data.length.toString());
                        return SizedBox(
                          height: 90.h,
                          child: DateTime.now().day != data[index]!.date.day
                              ? DateScreen(
                                  weekday: data[index]!.weekday,
                                  day: data[index]!.date.day.toString(),
                                )
                              : ThisDayScreen(
                                  weekday: data[index]!.weekday,
                                  day: data[index]!.date.day.toString(),
                                ),
                        );
                      });
                }, error: (error, st) {
                  log(error.toString());
                }, loading: () {
                  return const CircularProgressIndicator();
                }),
              ),
              HBox(20.h),
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
                      "Ramazon Ro'zasi",
                      style: AppTextStyle.instance.w700.copyWith(
                          fontSize: FontSizeConst.instance.extraLargeFont,
                          color: AppColors.blackColor),
                    ),
                    Padding(
                      padding: Dis.only(tb: 14.h),
                      child: CircularPercentIndicator(
                        linearGradient: AppColors.mainGreenGradient,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Og’iz yopish uchun",
                              style: AppTextStyle.instance.w400.copyWith(
                                  fontSize: FontSizeConst.instance.mediumFont,
                                  color: AppColors.blackColor),
                            ),
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
                                    h: 360.h,
                                    whichPray: 'Og’iz ochish duosi',
                                    arabicPray:
                                        'نَوَيْتُ أَنْ أَصُومَ صَوْمَ شَهْرَ رَمَضَانَ مِنَ الْفَجْرِ إِلَى الْمَغْرِبِ، خَالِصًا لِلهِ تَعَالَى أَللهُ أَكْبَرُ',
                                    latinPray:
                                        'Navaytu an asuvma sovma shahri ramazona minal fajri ilal mag‘ribi, xolisan lillahi ta’aalaa Allohu akbar.',
                                    meaningPray:
                                        'Ma’nosi: Ramazon oyining ro‘zasini subhdan to kun botguncha tutmoqni niyat qildim. Xolis Alloh uchun Alloh buyukdir.',
                                  );
                                },
                              );
                            },
                            h: 61.h,
                            w: 149.w,
                            radius: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                provider.when(data: (data) {
                                  return Text(
                                    data[1]!.saharlik,
                                    style: AppTextStyle.instance.w700.copyWith(
                                        fontSize:
                                            FontSizeConst.instance.mediumFont,
                                        color: AppColors.whiteColor),
                                  );
                                }, error: (e, st) {
                                  return Text(e.toString());
                                  // log(e.toString());
                                }, loading: () {
                                  return const CircularProgressIndicator();
                                }),
                                Text(
                                  "O'giz ochish duosi",
                                  style: AppTextStyle.instance.w700.copyWith(
                                    fontSize: FontSizeConst.instance.smallFont,
                                    color: AppColors.whiteColor,
                                  ),
                                )
                              ],
                            )),
                        MainGreenButton(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetHOme(
                                    h: 470.h,
                                    whichPray: 'Og’iz yopish duosi',
                                    arabicPray:
                                        'اَللَّهُمَّ لَكَ صُمْتُ وَ بِكَ آمَنْتُ وَ عَلَيْكَ تَوَكَّلْتُ وَ عَلَى رِزْقِكَ أَفْتَرْتُ، فَغْفِرْلِى مَا قَدَّمْتُ وَ مَا أَخَّرْتُ بِرَحْمَتِكَ يَا أَرْحَمَ الرَّاحِمِينَ',
                                    latinPray:
                                        'Allohumma laka sumtu va bika aamantu va aʼlayka tavakkaltu va aʼlaa rizqika aftartu, fag‘firliy ma qoddamtu va maa axxortu birohmatika yaa arhamar roohimiyn.',
                                    meaningPray:
                                        'Maʼnosi: Ey Alloh, ushbu Ro‘zamni Sen uchun tutdim va Senga iymon keltirdim va Senga tavakkal qildim va bergan rizqing bilan iftor qildim. Ey mehribonlarning eng mehriboni, mening avvalgi va keyingi gunohlarimni mag‘firat qilgil.',
                                  );
                                });
                          },
                          h: 61.h,
                          w: 149.w,
                          radius: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              provider.when(data: (data) {
                                return Text(
                                  data[1]!.xufton,
                                  style: AppTextStyle.instance.w700.copyWith(
                                      fontSize:
                                          FontSizeConst.instance.mediumFont,
                                      color: AppColors.whiteColor),
                                );
                              }, error: (e, st) {
                                return Text(e.toString());
                                // log(e.toString());
                              }, loading: () {
                                return const CircularProgressIndicator();
                              }),
                              Text(
                                "O'giz yopish duosi",
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
          ),
        ),
      ),
    );
  }
}
