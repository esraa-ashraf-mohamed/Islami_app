import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/theme.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.radioLogo),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Radio Al-Quran Al-Karem',
              style: AppTheme.mediumTitleTextStyle,
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
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: AppColors.orange,
      iconSize: size,
    );
  }
}
