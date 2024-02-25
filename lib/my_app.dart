import 'package:flutter/material.dart';
import 'package:islami_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'providers/locale_provider.dart';
import 'screens/ahdeth_screen/hadith_details.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/quran_screen/quran_details.dart';
import 'screens/splash_scraeen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      theme: AppTextStyle.lightTheme,
      darkTheme: AppTextStyle.darkTheme,
      themeMode: provider.currentThemeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HadithDetails.routeName: (_) => const HadithDetails(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranDetails.routeName: (_) => const QuranDetails(),
      },
      initialRoute: SplashScreen.routeName,
      locale: Locale(provider.currentLocale),
    );
  }
}
