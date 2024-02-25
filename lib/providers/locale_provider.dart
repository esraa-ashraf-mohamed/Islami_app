import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_assets.dart';
import '../utils/theme.dart';

class LocaleProvider extends ChangeNotifier {
  SharedPreferences? _prefs;
  String currentLocale = 'en';
  ThemeMode currentThemeMode = ThemeMode.light;

  LocaleProvider() {
    initPreferences();
  }

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    currentLocale = _prefs!.getString('locale') ?? 'en';
    currentThemeMode = _prefs!.getBool('isDarkTheme') ?? false
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  void appLanguage(String newLanguage) {
    if (currentLocale == newLanguage) return;
    currentLocale = newLanguage;
    _prefs!.setString('locale', newLanguage);
    notifyListeners();
  }

  toggleTheme(bool darkThemeSwitchValue) {
    currentThemeMode = darkThemeSwitchValue ? ThemeMode.dark : ThemeMode.light;
    _prefs!.setBool('isDarkTheme', darkThemeSwitchValue);
    notifyListeners();
  }

  bool get isLightModeEnabled => currentThemeMode == ThemeMode.light;

  String get mainBackground =>
      isLightModeEnabled ? AppAssets.background : AppAssets.darkBackground;

  TextStyle get appBarTextStyle => isLightModeEnabled
      ? AppTextStyle.appBarTextStyle
      : AppTextStyle.appBarDarkTextStyle;

  TextStyle get mediumTitleTextStyle => isLightModeEnabled
      ? AppTextStyle.mediumTitleTextStyle
      : AppTextStyle.mediumTitleDarkTextStyle;

  TextStyle get regularTitleTextStyle => isLightModeEnabled
      ? AppTextStyle.regularTitleTextStyle
      : AppTextStyle.regularTitleDarkTextStyle;

  TextStyle get regularContentTextStyle => isLightModeEnabled
      ? AppTextStyle.regularTitleTextStyle
      : AppTextStyle.regularTitleDarkTextStyle
          .copyWith(color: AppColors.yellow);

  Color get containerColor =>
      isLightModeEnabled ? AppColors.white : AppColors.onDarkBlue;

  Color get boxColor =>
      isLightModeEnabled ? AppColors.primaryLight : AppColors.yellow;

  String get splash =>
      isLightModeEnabled ? AppAssets.splash : AppAssets.darkSplash;

  String get sebha =>
      isLightModeEnabled ? AppAssets.sebha : AppAssets.darkSebha;
}
