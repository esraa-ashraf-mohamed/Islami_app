import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/screens/quran_screen/quran_details.dart';
import 'package:islami_app/screens/quran_screen/sura_details_args.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_constants.dart';
import 'package:provider/provider.dart';

import '../../providers/locale_provider.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.quranLogo))),
        const SizedBox(
          height: 4,
        ),
        Expanded(
            flex: 7,
            child: Stack(
              alignment: Alignment.center,
              children: [
                buildTapContent(context),
                Container(
                  width: 3,
                  color: AppColors.primaryLight,
                  height: double.infinity,
                )
              ],
            ))
      ],
    );
  }

  Widget buildTapContent(context) {
    var themeProvider = Provider.of<LocaleProvider>(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.primaryLight,
          height: 3,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context).suraName,
                textAlign: TextAlign.center,
                style: themeProvider.mediumTitleTextStyle,
              ),
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context).verses,
                textAlign: TextAlign.center,
                style: themeProvider.mediumTitleTextStyle,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          color: AppColors.primaryLight,
          height: 3,
          width: double.infinity,
        ),
        Expanded(flex: 7, child: buildListView())
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: suraNames.length,
      itemBuilder: (context, index) {
        var themeProvider = Provider.of<LocaleProvider>(context);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, QuranDetails.routeName,
                arguments:
                    SuraDetailsArgs(name: suraNames[index], index: index));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                    suraNames[index],
                textAlign: TextAlign.center,
                style: themeProvider.regularTitleTextStyle,
              )),
              Expanded(
                  child: Text(
                    '${versesNumber[index]}',
                textAlign: TextAlign.center,
                style: themeProvider.regularTitleTextStyle,
              ))
            ],
          ),
        );
      },
    );
  }
}
