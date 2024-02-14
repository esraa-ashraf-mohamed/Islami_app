import 'package:flutter/material.dart';
import 'package:islami_app/screens/ahdeth_screen/ahadeth_screen.dart';
import 'package:islami_app/screens/home_screen/home_screen.dart';
import 'package:islami_app/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/screens/radio_screen/radio_screen.dart';
import 'package:islami_app/screens/sebha_screen/sebha_screen.dart';
import 'package:islami_app/screens/splash_scraeen/splash_screen.dart';

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
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        HadithScreen.routeName: (_) => const HadithScreen(),
        SebhaScreen.routeName: (_) => const SebhaScreen(),
        QuranScreen.routeName: (_) => const QuranScreen(),
        RadioScreen.routeName: (_) => const RadioScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
