import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/namoz_list_tlie.dart';

import '../../../config/appColors.dart';

class NamozTime extends StatefulWidget {
  const NamozTime({super.key});

  @override
  State<NamozTime> createState() => _NamozTimeState();
}

class _NamozTimeState extends State<NamozTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Namoz vaqti',
          style: AppTextStyle.instance.w700.copyWith(
              color: AppColors.whiteColor,
              fontSize: FontSizeConst.instance.extraLargeFont),
        ),
      ),
      backgroundColor: AppColors.mainGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Container(
            padding: Dis.only(lr: 20.w,tb: 10.h),
            height: 491,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: AppColors.mainBackground),
            child: ListView(
              children: const [
                NamozListTile(),
                NamozListTile(),
                NamozListTile(),
              ],
            ),
                          ),
          ],
        ),
      ),
    );
  }
}
