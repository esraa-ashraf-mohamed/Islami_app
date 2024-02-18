import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_constants.dart';
import 'package:islami_app/utils/theme.dart';

import '../../utils/app_colors.dart';
import 'hadith_details_args.dart';

class HadithDetails extends StatefulWidget {
  static const String routeName = 'Hadith Details';

  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadithDetailsArgs;

    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        appBar: buildAppBar(args.title),
        backgroundColor: AppColors.transparent,
        body: args.content.isEmpty
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
                    args.content[index],
                    style: AppTheme.regularTitleTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  itemCount: args.content.length,
                ),
              ),
      ),
    );
  }
}
