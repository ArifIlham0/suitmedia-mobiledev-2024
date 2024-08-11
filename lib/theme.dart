import 'package:flutter/material.dart';

const Color kWhite = Color(0xFFFFFFFF);
const Color kBlue = Color(0xFF2B637B);
const Color kBlack = Color(0xFF000000);
const Color kRed = Colors.red;
const Color kGrey = Colors.grey;
const Color kLightGrey = Color(0xFFF3F4F6);

class ThemeClass {
  static ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: kBlue,
    ),
  );
  static ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: kBlue,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
