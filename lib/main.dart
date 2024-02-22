import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/ui/pages/nav_bar_pages/home_page.dart';
import 'package:ramazon_taqvimi/src/ui/pages/nav_bar_pages/main_nav_page.dart';
import 'package:ramazon_taqvimi/src/ui/pages/splash_page/scroll_pag.dart';
import 'package:ramazon_taqvimi/src/ui/pages/splash_page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashPage(),
      routes: {
        ScrollPage.id:(context)=>const ScrollPage(),
        MainNavpage.id:(context)=>const MainNavpage(),
      },
    );
  }
}


