import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/config/appColors.dart';
import 'package:ramazon_taqvimi/src/config/router.dart';
import 'package:ramazon_taqvimi/src/repository/utils/app_padding.dart';
import 'package:ramazon_taqvimi/src/repository/utils/screen_utils.dart';
import 'package:ramazon_taqvimi/src/ui/screens/settings_screens/azon_settings.dart';
import 'package:ramazon_taqvimi/src/ui/screens/settings_screens/connect_screen.dart';
import 'package:ramazon_taqvimi/src/ui/screens/settings_screens/language_settings.dart';
import 'package:ramazon_taqvimi/src/ui/screens/settings_screens/time_settings.dart';
import 'package:ramazon_taqvimi/src/ui/widgets/settings_list_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainGreen,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          )),
      backgroundColor: AppColors.mainBackground,
      body: Padding(
        padding: Dis.only(lr: 20.w, tb: 10.h),
        child: Column(
          children: [
            SettingsListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.blackColor,
                ),
                onTap: () {
                  AppRouter.go(context, const TimeSettings());
                },
                title: "Vaqt sozlamalari"),
            SettingsListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.blackColor,
                ),
                onTap: () {
                  AppRouter.go(context, const AzonSettings());
                },
                title: "Azon sozlamari"),
            SettingsListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.blackColor,
                ),
                onTap: () {
                  AppRouter.go(context, const LanguageSettings());
                },
                title: "Ilova tili"),
            SettingsListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.blackColor,
                ),
                onTap: () {
                  AppRouter.go(
                    context,
                    const Connect(),
                  );
                },
                title: "Murojaat"),
          ],
        ),
      ),
    );
  }
}
