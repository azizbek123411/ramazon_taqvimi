import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';

class NamozListTile extends StatelessWidget {
  const NamozListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dis.only(tb: 8.h),
      width: 345.w,
      height: 75.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.colorF4DEBD,
      ),
      child: ListTile(
        leading: SvgPicture.asset("assets/svg/sunset.svg"),
        title: Text(
          "Bomdod",
          style: AppTextStyle.instance.w500.copyWith(
            color: AppColors.blackColor,
            fontSize: FontSizeConst.instance.smallFont,
          ),
        ),
        subtitle:  Text(
          "06:19-07:37",
          style: AppTextStyle.instance.w700.copyWith(
            color: AppColors.blackColor,
            fontSize: FontSizeConst.instance.mediumFont,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg/Frame (1).svg"),
        ),
      ),
    );
  }
}
