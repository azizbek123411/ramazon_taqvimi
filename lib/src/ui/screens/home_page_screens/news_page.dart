import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/repository/utils/space.dart';

import '../../../config/appColors.dart';
import '../../../config/router.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: Dis.all(6),
          child: CircleAvatar(
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
        ),
      ),
      body: Padding(
        padding: Dis.only(lr: 20.w, tb: 10.h),
        child: Column(
          children: [
            Text(
                "O‘zbekistonliklar Ramazon hayitida 4 kun dam oladi — prezident qarori",
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.largeFont,
                  color: AppColors.mainGreen,
                )),
            HBox(20.h),
            Text(
                "Ramazon hayitida o‘zbekistonliklar 4 kun — 21−24-aprel kunlari dam oladigan bo‘ldi. 24-aprel ko‘chirilgan dam olish kuni hisoblanmaydi, ya’ni 29-aprel 5 kun ishlaydiganlar uchun dam olish kuni bo‘ladi.",
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.smallFont,
                  color: AppColors.greyColor,
                )),
          ],
        ),
      ),
    );
  }
}
