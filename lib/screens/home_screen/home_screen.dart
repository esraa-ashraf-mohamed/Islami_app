import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/screens/ahdeth_screen/ahadeth_screen.dart';
import 'package:islami_app/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/screens/radio_screen/radio_screen.dart';
import 'package:islami_app/screens/sebha_screen/sebha_screen.dart';
import 'package:islami_app/screens/settings_screen/settings_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/locale_provider.dart';
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
    const RadioScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<LocaleProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeProvider.mainBackground),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).title)),
        bottomNavigationBar: buildBottomNavigationBar(
            context: context,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            }),
        body: screens[currentIndex],
      ),
    );
  }
}
