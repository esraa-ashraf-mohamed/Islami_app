import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/locale_provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<LocaleProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.radioLogo),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              AppLocalizations.of(context).radioAlQuranAlkarem,
              style: themeProvider.mediumTitleTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIcon(icon: Icons.skip_previous_rounded, size: 40),
              buildIcon(
                icon: Icons.play_arrow_rounded,
                size: 70,
              ),
              buildIcon(icon: Icons.skip_next_rounded, size: 40)
            ],
          )
        ],
      ),
    );
  }

  IconButton buildIcon({required IconData icon, double? size}) {
    var themeProvider = Provider.of<LocaleProvider>(context);
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: themeProvider.isLightModeEnabled
          ? AppColors.primaryLight
          : AppColors.yellow,
      iconSize: size,
    );
  }
}
