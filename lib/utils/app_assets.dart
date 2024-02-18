import 'package:flutter/material.dart';

abstract class AppAssets {
  static const String splash = 'assets/images/splash-screen.png';
  static const String quranLogo = 'assets/images/quran_logo.png';
  static const String icSebha = 'assets/images/ic_sebha.png';
  static const String icRadio = 'assets/images/ic_radio.png';
  static const String icQuran = 'assets/images/ic_quran.png';
  static const String icHadith = 'assets/images/ic_ahadith.png';
  static const String background = 'assets/images/background.png';
  static const String hadithLogo = 'assets/images/hadith.png';
  static const String radioLogo = 'assets/images/radioLogo.png';
  static const String sebha = 'assets/images/sebha.png';
}

BoxDecoration backgroundImage() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            AppAssets.background,
          ),
          fit: BoxFit.fill));
}