import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screens/ahdeth_screen/hadith_details.dart';
import 'package:islami_app/screens/ahdeth_screen/hadith_details_args.dart';
import 'package:islami_app/utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/theme.dart';

class HadithScreen extends StatefulWidget {
  static const String routeName = 'hadith';

  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithDetailsArgs> hadithDetails = [];

  @override
  Widget build(BuildContext context) {
    if (hadithDetails.isEmpty) {
      readFile();
    }
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
        Expanded(
            flex: 7,
            child: hadithDetails.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.orange,
                  ))
                : buildListView())
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: hadithDetails.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, HadithDetails.routeName,
                arguments: HadithDetailsArgs(
                    title: hadithDetails[index].title,
                    content: hadithDetails[index].content));
          },
          child: Text(
            '${hadithDetails[index].title}',
            textAlign: TextAlign.center,
            style: AppTheme.regularTitleTextStyle,
          ),
        );
      },
    );
  }

  void readFile() async {
    String hadithContent =
        await rootBundle.loadString('assets/hadithAssets/ahadeth.txt');
    List hadith = hadithContent.split('#\r\n');
    for (int i = 0; i < hadith.length; i++) {
      List hadithLines = hadith[i].split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      HadithDetailsArgs hadithArgs =
          HadithDetailsArgs(title: title, content: hadithLines);
      hadithDetails.add(hadithArgs);
      setState(() {});
    }
  }
}
