import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/locale_provider.dart';
import 'package:islami_app/screens/quran_screen/sura_details_args.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<LocaleProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) {
      readFile(args.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.mainBackground), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title: Text(args.name)),
        backgroundColor: AppColors.transparent,
        body: suraContent.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryLight,
              ))
            : Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03,
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03,
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: provider.containerColor,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    suraContent[index],
                    style: provider.regularContentTextStyle,
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
