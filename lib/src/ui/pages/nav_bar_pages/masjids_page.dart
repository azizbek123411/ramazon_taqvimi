import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';

import '../../../repository/utils/app_padding.dart';

class MasjidsPage extends StatefulWidget {
  const MasjidsPage({super.key});

  @override
  State<MasjidsPage> createState() => _MasjidsPageState();
}

class _MasjidsPageState extends State<MasjidsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: Container(
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
            title: Text(
              "Eng yaqin Masjidlar",
              style: AppTextStyle.instance.w700.copyWith(
                fontSize: FontSizeConst.instance.extraLargeFont,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
      body: FlutterMap(
        options: const MapOptions(
            initialCenter: LatLng(
              23.32323,
              90.3232323,
            ),
            initialZoom: 8),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          )
        ],
      ),
    );
  }
}
