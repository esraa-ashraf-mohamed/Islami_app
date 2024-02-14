import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/theme.dart';

class SebhaScreen extends StatelessWidget {
  static const String routeName = 'sebha';

  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.headSebha),
          Image.asset(AppAssets.bodySebha),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Number of praises',
                    style: AppTheme.mediumTitleTextStyle,
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.all(15),
                    child: const Text('30',
                        style: AppTheme.regularTitleTextStyle)),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    padding: const EdgeInsets.all(10),
                    child: const Text('Subhana Allah',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
