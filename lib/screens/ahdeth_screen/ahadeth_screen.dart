import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/theme.dart';

class HadithScreen extends StatelessWidget {
  static const String routeName = 'hadith';

  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.hadithLogo))),
        const SizedBox(
          height: 4,
        ),
        Expanded(
            flex: 7,
            child: Stack(
              alignment: Alignment.center,
              children: [
                buildTapContent(),
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
                'Hadith',
                textAlign: TextAlign.center,
                style: AppTheme.mediumTitleTextStyle,
              ),
            ),
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
              'Hadith Name',
              textAlign: TextAlign.center,
              style: AppTheme.regularTitleTextStyle,
            )),
          ],
        );
      },
    );
  }
}
