import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/theme.dart';

class SebhaScreen extends StatefulWidget {
  static const String routeName = 'sebha';

  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int number = 0;
  double angle = 0.0;
  List praises = ['Subhana Allah', 'Allah Akbar', 'Al-hamdulillah'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Transform.rotate(
              angle: angle * (pi / 180),
              child: Image.asset(
                AppAssets.sebha,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 45.0, bottom: 25.0),
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
                    child:
                        Text('$number', style: AppTheme.regularTitleTextStyle)),
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
                      decoration: const BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      padding: const EdgeInsets.all(10),
                      child: Text('${praises[index]}',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
