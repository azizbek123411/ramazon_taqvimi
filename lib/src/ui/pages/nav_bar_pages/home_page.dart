import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';

import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/repository/utils/space.dart';
import 'package:ramazon_taqvimi/src/ui/screens/home_page_screens/date_screen.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/main_green_button.dart';

import '../../widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110.h),
        child: const HomeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HBox(20.h),
            SizedBox(
              height: 80.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DateScreen(),
                  DateScreen(),
                  DateScreen(),
                  DateScreen(),
                  DateScreen(),
                  DateScreen(),
                ],
              ),
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
                                fontSize: FontSizeConst.instance.extraLargeFont,
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
                        onTap: (){},
                          h: 61.h,
                          w: 149.w,
                          radius: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "04 : 00 AM",
                                style: AppTextStyle.instance.w700.copyWith(
                                    fontSize: FontSizeConst.instance.mediumFont,
                                    color: AppColors.whiteColor),
                              ),
                              Text(
                                "Og’iz yopish duosi",
                                style: AppTextStyle.instance.w700.copyWith(
                                    fontSize: FontSizeConst.instance.smallFont,
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          )),
                      MainGreenButton(
                          onTap: (){},
                          h: 61.h,
                          w: 149.w,
                          radius: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "04 : 00 AM",
                                style: AppTextStyle.instance.w700.copyWith(
                                    fontSize: FontSizeConst.instance.mediumFont,
                                    color: AppColors.whiteColor),
                              ),
                              Text(
                                "Og’iz yopish duosi",
                                style: AppTextStyle.instance.w700.copyWith(
                                    fontSize: FontSizeConst.instance.smallFont,
                                    color: AppColors.whiteColor),
                              ),
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
    );
  }
}
