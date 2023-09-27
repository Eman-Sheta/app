import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffffffff);
  static Color primaryDark = Color(0xff141A2E);
  static Color yellowColor = Color(0xffFACC1D);
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor, unselectedItemColor: whiteColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackColor),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: blackColor),
        titleSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
      ));
}
