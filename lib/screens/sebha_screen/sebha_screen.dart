import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../providers/locale_provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int number = 0;
  double angle = 0.0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<LocaleProvider>(context);
    List praises = [
      AppLocalizations.of(context).subhanaAllah,
      AppLocalizations.of(context).allahAkbar,
      AppLocalizations.of(context).alHamidullah
    ];
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Transform.rotate(
              angle: angle * (pi / 180),
              child: Image.asset(
                themeProvider.sebha,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, bottom: 25.0),
                  child: Text(
                    AppLocalizations.of(context).numberOfPraises,
                    style: themeProvider.mediumTitleTextStyle,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: themeProvider.isLightModeEnabled
                            ? AppColors.primaryLight
                            : AppColors.darkBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.all(15),
                    child: Text('$number',
                        style: themeProvider.regularTitleTextStyle)),
                InkWell(
                  onTap: () {
                    setState(() {
                      number++;
                      angle += 11.5;
                      if (number > 30) {
                        number = 0;
                        index++;
                        if (index == praises.length) {
                          index = 0;
                        }
                      }
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: themeProvider.boxColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      padding: const EdgeInsets.all(10),
                      child: Text('${praises[index]}',
                          style: themeProvider.isLightModeEnabled
                              ? AppTextStyle.mediumTitleTextStyle
                              : AppTextStyle.mediumTitleDarkTextStyle
                                  .copyWith(color: AppColors.lightBlack))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
