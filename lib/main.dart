import 'package:flutter/material.dart';
import 'package:islami_app/my_app.dart';
import 'package:islami_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
    ),
  ], child: const MyApp()));
}
