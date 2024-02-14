import 'package:flutter/material.dart';
import 'package:islami_app/screens/ahdeth_screen/ahadeth_screen.dart';
import 'package:islami_app/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/screens/radio_screen/radio_screen.dart';
import 'package:islami_app/screens/sebha_screen/sebha_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

import '../../utils/app_constants.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [
    const QuranScreen(),
    const HadithScreen(),
    const SebhaScreen(),
    const RadioScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.background,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(onTap: (index) {
          currentIndex = index;
          setState(() {});
        }),
        body: screens[currentIndex],
      ),
    );
  }
}
