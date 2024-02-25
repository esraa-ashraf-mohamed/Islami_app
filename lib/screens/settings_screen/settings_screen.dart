import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/locale_provider.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static const englishValue = 'en';
  static const arabicValue = 'ar';
  String selectedLocale = englishValue;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).language,
          style: provider.mediumTitleTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: provider.boxColor),
          child: DropdownButton<String>(
            iconSize: 35,
            iconEnabledColor: provider.isLightModeEnabled
                ? AppColors.onPrimaryLight
                : AppColors.lightBlack,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            padding: const EdgeInsets.all(10),
            dropdownColor: provider.boxColor,
            style: provider.regularTitleTextStyle,
            value: selectedLocale,
            items: [
              DropdownMenuItem(
                value: englishValue,
                child: Text(
                  'English',
                  style: provider.isLightModeEnabled
                      ? AppTextStyle.mediumTitleTextStyle
                      : AppTextStyle.mediumTitleDarkTextStyle
                          .copyWith(color: AppColors.lightBlack),
                ),
              ),
              DropdownMenuItem(
                value: arabicValue,
                child: Text(
                  'العربية',
                  style: provider.isLightModeEnabled
                      ? AppTextStyle.mediumTitleTextStyle
                      : AppTextStyle.mediumTitleDarkTextStyle
                          .copyWith(color: AppColors.lightBlack),
                ),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
                selectedLocale = newValue!;
                provider.appLanguage(selectedLocale);
              });
            },
            isExpanded: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context).theme,
          style: provider.mediumTitleTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Switch(
            value: provider.currentThemeMode == ThemeMode.dark,
            onChanged: (newValue) {
              provider.toggleTheme(newValue);
            })
      ],
    );
  }
}
