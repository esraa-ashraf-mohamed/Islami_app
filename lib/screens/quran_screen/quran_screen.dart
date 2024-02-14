import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/theme.dart';

class QuranScreen extends StatelessWidget {
  static const String routeName = 'quran';

  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.quranLogo))),
        SizedBox(
          height: 4,
        ),
        Expanded(
            flex: 7,
            child: Stack(
              alignment: Alignment.center,
              children: [
                buildTapContent(),
                Container(
                  width: 3,
                  color: AppColors.orange,
                  height: double.infinity,
                )
              ],
            ))
      ],
    );
  }

  Widget buildTapContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.orange,
          height: 3,
        ),
        const SizedBox(
          height: 4,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                'Sura Name',
                textAlign: TextAlign.center,
                style: AppTheme.mediumTitleTextStyle,
              ),
            ),
            Expanded(
              child: Text(
                'Verses',
                textAlign: TextAlign.center,
                style: AppTheme.mediumTitleTextStyle,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          color: AppColors.orange,
          height: 3,
          width: double.infinity,
        ),
        Expanded(flex: 7, child: buildListView())
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 70,
      itemBuilder: (context, index) {
        return const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Text(
              'Sura Name',
              textAlign: TextAlign.center,
              style: AppTheme.regularTitleTextStyle,
            )),
            Expanded(
                child: Text(
              'Sura Name',
              textAlign: TextAlign.center,
              style: AppTheme.regularTitleTextStyle,
            ))
          ],
        );
      },
    );
  }
}
