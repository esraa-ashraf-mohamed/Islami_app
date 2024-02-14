import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/theme.dart';

typedef onTap = void Function(int index);

int currentIndex = 0;

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.transparent,
    title: const Text(
      'Islami',
      style: AppTheme.appBarTextStyle,
    ),
    centerTitle: true,
  );
}

Widget buildBottomNavigationBar({onTap}) => Theme(
      data: ThemeData(canvasColor: AppColors.orange),
      child: BottomNavigationBar(
        items: [
          buildBottomNavigationBarItem(AppAssets.ic_quran, 'quran'),
          buildBottomNavigationBarItem(
            AppAssets.ic_ahadith,
            'hadith',
          ),
          buildBottomNavigationBarItem(
            AppAssets.ic_sebha,
            'sebha',
          ),
          buildBottomNavigationBarItem(
            AppAssets.ic_radio,
            'radio',
          ),
        ],
        selectedItemColor: AppColors.lightBlack,
        iconSize: 34,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );

BottomNavigationBarItem buildBottomNavigationBarItem(
        String iconPath, String label) =>
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(iconPath)),
      label: label,
    );
