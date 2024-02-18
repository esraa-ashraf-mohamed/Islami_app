import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screens/quran_screen/sura_details_args.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_constants.dart';
import 'package:islami_app/utils/theme.dart';

import '../../utils/app_colors.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = 'Quran Details';

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List suraContent = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) {
      readFile(args.index);
    }

    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        appBar: buildAppBar(args.name),
        backgroundColor: AppColors.transparent,
        body: suraContent.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.orange,
              ))
            : Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03,
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03,
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: AppColors.white,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    suraContent[index],
                    style: AppTheme.regularTitleTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  itemCount: suraContent.length,
                ),
              ),
      ),
    );
  }

  void readFile(index) async {
    String content =
        await rootBundle.loadString('assets/quranAssets/${index + 1}.txt');
    List lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].isNotEmpty) {
        lines[i] += "(${i + 1})";
      }
    }
    suraContent = lines;
    setState(() {});
  }
}
