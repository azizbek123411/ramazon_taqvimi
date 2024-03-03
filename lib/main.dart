import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramazon_taqvimi/src/ui/pages/nav_bar_pages/main_nav_page.dart';
import 'package:ramazon_taqvimi/src/ui/pages/splash_page/scroll_pag.dart';
import 'package:ramazon_taqvimi/src/ui/pages/splash_page/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en-EN"),
        Locale("uz-UZ"),
        Locale("ru-RU"),
      ],
      path: "assets/localization",
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashPage(),
      // home:const NewPage(),
      routes: {
        ScrollPage.id: (context) => const ScrollPage(),
        MainNavpage.id: (context) => const MainNavpage(),
      },
    );
  }
}
