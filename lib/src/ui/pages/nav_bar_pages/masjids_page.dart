import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/providers/times_provider.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';

import '../../../repository/utils/app_padding.dart';

class MasjidsPage extends StatefulHookConsumerWidget {
  const MasjidsPage({super.key});

  @override
  ConsumerState<MasjidsPage> createState() => _MasjidsPageState();
}

class _MasjidsPageState extends ConsumerState<MasjidsPage> {
  Position? currentLocation;
  late bool servicePermission;
  late LocationPermission permission;

  Future<Position> getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(distanceProvider);
    var marker = <Marker>[];
    marker = [
      Marker(
        point: LatLng(
          currentLocation?.latitude ?? 0,
          currentLocation?.longitude ?? 0,
        ),
        child: const Icon(
          Icons.location_on_rounded,
          color: Colors.red,
          size: 31,
        ),
      ),
      Marker(
        point: LatLng(
          currentLocation?.latitude ?? 0,
          currentLocation?.longitude ?? 0,
        ),
        child: const Icon(
          Icons.location_on_rounded,
          color: Colors.red,
          size: 31,
        ),
      ),
    ];

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
              "near_masjids",
              style: AppTextStyle.instance.w700.copyWith(
                fontSize: FontSizeConst.instance.extraLargeFont,
                color: AppColors.whiteColor,
              ),
            ).tr(),
          ),
        ),
      ),
      body: FlutterMap(
          options: MapOptions(
              initialCenter: LatLng(
                currentLocation?.latitude ?? 0,
                currentLocation?.longitude ?? 0,
              ),
              initialZoom: 10),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
      provider.when(data: (data) {
        return ListView.builder(
            itemCount:data.length,
            itemBuilder: (context, index) {
          return MarkerLayer(markers: [
            Marker(
              point: LatLng(data[index].lat, data[index].long),
              child: SvgPicture.asset("assets/svg/mosque-_1_ 3.svg",height: 20.h,width: 20.w,)
            ),
          ]);
        });
      }, error: (error, st) {
        return Text(error.toString());
      }, loading: () {
        return const CircularProgressIndicator();
      }),
            MarkerLayer(
              markers: [
                Marker(
                  point:
                    LatLng(
                      currentLocation?.latitude ?? 0,
                      currentLocation?.longitude ?? 0,
                  ),
                  child: const Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                    size: 31,
                  ),
                ),
              ],
            )
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainGreen,
        child: SvgPicture.asset("assets/svg/target-03.svg"),
        onPressed: () async {
          currentLocation = await getCurrentLocation();
          log("$currentLocation");
        },
      ),
    );
  }
}
