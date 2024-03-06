import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ramazon_taqvimi/src/config/font_size.dart';
import 'package:ramazon_taqvimi/src/repository/constants/text_styles.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/namoz_list_tlie.dart';

import '../../../config/appColors.dart';
import '../../../repository/providers/times_provider.dart';

class NamozTime extends StatefulHookConsumerWidget {
  const NamozTime({super.key});

  @override
  ConsumerState<NamozTime> createState() => _NamozTimeState();
}

class _NamozTimeState extends ConsumerState<NamozTime> {
  final volumeProvider1 = StateProvider((ref) => false);
  final volumeProvider2 = StateProvider((ref) => false);
  final volumeProvider3 = StateProvider((ref) => false);
  final volumeProvider4 = StateProvider((ref) => false);
  final volumeProvider5 = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(namozTimes);
    final volumeOnOf1 = ref.watch(volumeProvider1);
    final volumeOnOf2 = ref.watch(volumeProvider2);
    final volumeOnOf3 = ref.watch(volumeProvider3);
    final volumeOnOf4 = ref.watch(volumeProvider4);
    final volumeOnOf5 = ref.watch(volumeProvider5);
    final thisDay=DateTime.now().day-1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'namoz_time',
          style: AppTextStyle.instance.w700.copyWith(
              color: AppColors.whiteColor,
              fontSize: FontSizeConst.instance.extraLargeFont),
        ).tr(),
      ),
      backgroundColor: AppColors.mainGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/img.png"),
                ),
              ),
            ),
            Container(
                padding: Dis.only(lr: 20.w, tb: 10.h),
                height: 491,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                    color: AppColors.mainBackground),
                child: provider.when(data: (data) {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                      return SizedBox(
                        height: 500,
                        child: ListView(
                          children: [
                            NamozListTile(
                              hours: data[thisDay]!.saharlik,
                              namozTiming: "bomdod".tr(),
                              actionIcon: IconButton(
                                onPressed: () {
                                  log(DateTime.now().day.toString());
                                  ref
                                      .read(volumeProvider1.notifier)
                                      .state = !volumeOnOf1;
                                },
                                icon: volumeOnOf1
                                    ? SvgPicture.asset(
                                    "assets/svg/volume_on.svg")
                                    : SvgPicture.asset(
                                    "assets/svg/volume_off.svg"),
                              ),
                            ),
                            NamozListTile(
                              hours: data[thisDay]!.peshin,
                              namozTiming: "peshin".tr(),
                              actionIcon: IconButton(
                                onPressed: () {
                                  ref
                                      .read(volumeProvider2.notifier)
                                      .state = !volumeOnOf2;
                                },
                                icon: volumeOnOf2
                                    ? SvgPicture.asset(
                                    "assets/svg/volume_on.svg")
                                    : SvgPicture.asset(
                                    "assets/svg/volume_off.svg"),
                              ),
                            ),
                            NamozListTile(
                              hours: data[thisDay]!.asr,
                              namozTiming: "asr".tr(),
                              actionIcon: IconButton(
                                onPressed: () {
                                  ref
                                      .read(volumeProvider3.notifier)
                                      .state = !volumeOnOf3;
                                },
                                icon: volumeOnOf3
                                    ? SvgPicture.asset(
                                    "assets/svg/volume_on.svg")
                                    : SvgPicture.asset(
                                    "assets/svg/volume_off.svg"),
                              ),
                            ),
                            NamozListTile(
                              hours: data[thisDay]!.shom,
                              namozTiming: "shom".tr(),
                              actionIcon: IconButton(
                                onPressed: () {
                                  ref
                                      .read(volumeProvider5.notifier)
                                      .state = !volumeOnOf5;
                                },
                                icon: volumeOnOf5
                                    ? SvgPicture.asset(
                                    "assets/svg/volume_on.svg")
                                    : SvgPicture.asset(
                                    "assets/svg/volume_off.svg"),
                              ),
                            ),
                            NamozListTile(
                                hours: data[thisDay]!.xufton,
                                namozTiming: "xufton".tr(),
                                actionIcon: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(volumeProvider4.notifier)
                                        .state = !volumeOnOf4;
                                  },
                                  icon: volumeOnOf4
                                      ? SvgPicture.asset(
                                      "assets/svg/volume_on.svg")
                                      : SvgPicture.asset(
                                      "assets/svg/volume_off.svg"),
                                )),
                          ],
                        ),
                      );
                      });
                }, error: (error, st) {
                  return Text(
                    error.toString(),
                    style: const TextStyle(fontSize: 20),
                  );
                }, loading: () {
                  return const CircularProgressIndicator();
                })),
          ],
        ),
      ),
    );
  }
}
