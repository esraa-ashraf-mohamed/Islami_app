import 'package:flutter/material.dart';
import 'package:islami_app/screens/ahdeth_screen/hadith_details.dart';
import 'package:islami_app/screens/home_screen/home_screen.dart';
import 'package:islami_app/screens/quran_screen/quran_details.dart';
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
        HadithDetails.routeName: (_) => const HadithDetails(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranDetails.routeName: (_) => const QuranDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
