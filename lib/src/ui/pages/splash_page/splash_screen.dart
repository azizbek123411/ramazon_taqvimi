import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramazon_taqvimi/src/config/router.dart';
import 'package:ramazon_taqvimi/src/ui/pages/splash_page/scroll_pag.dart';

import '../../../config/appColors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      AppRouter.id(context, ScrollPage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/image2.png"),
                fit: BoxFit.cover),
            color: AppColors.mainGreen),
        child: Center(
          child: SvgPicture.asset(
            "assets/svg/sunset.svg",
            height: 100,
          ),
        ),
      ),
    );
  }
}
