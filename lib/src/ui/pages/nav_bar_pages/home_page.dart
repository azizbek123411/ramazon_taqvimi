import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';

import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';

import '../../widgets/home_page_widgets/home_appbar.dart';

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

        ),
      ),
    );
  }
}
