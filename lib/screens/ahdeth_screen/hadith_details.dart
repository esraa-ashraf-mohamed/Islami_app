import 'package:flutter/material.dart';
import 'package:islami_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<LocaleProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as HadithDetailsArgs;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.mainBackground), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title: Text(args.title)),
        backgroundColor: AppColors.transparent,
        body: args.content.isEmpty
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
                    args.content[index],
                    style: provider.regularContentTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  itemCount: args.content.length,
                ),
              ),
      ),
    );
  }
}
