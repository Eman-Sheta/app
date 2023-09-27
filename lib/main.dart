import 'package:app_islami/hadeth/hadeth_details.dart';
import 'package:app_islami/home_screen.dart';
import 'package:app_islami/my_theme.dart';
import 'package:app_islami/quran/sura_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Suradetails.routeName: (context) => Suradetails(),
        Hadethdetails.routeName: (context) => Hadethdetails(),
      },
      theme: MyTheme.lightMode,
    );
  }
}
