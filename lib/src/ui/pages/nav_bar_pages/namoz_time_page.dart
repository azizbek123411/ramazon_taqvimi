import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(namozTimes);
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
                        for(final item in data){
                          if(DateTime.now().day==item!.date.day){
                            return SizedBox(
                              height: 500,
                              child:
                              ListView(
                                children: [
                                  NamozListTile(
                                    hours: data[index]!.saharlik,
                                    namozTiming: "Bomdod",
                                  ),
                                  NamozListTile(
                                    hours: data[index]!.peshin,
                                    namozTiming: "Peshin",
                                  ),
                                  NamozListTile(
                                    hours: data[index]!.asr,
                                    namozTiming: "Asr",
                                  ),
                                  NamozListTile(
                                    hours: data[index]!.shom,
                                    namozTiming: "Shom",
                                  ),
                                  NamozListTile(
                                    hours: data[index]!.xufton,
                                    namozTiming: "Xufton",
                                  ),
                                ],
                              ),
                            );
                          }
                        }


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
