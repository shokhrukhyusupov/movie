import 'package:flutter/material.dart';
import 'package:movie/styles/colors.dart';

abstract class TextThemes {
  static const TextTheme dTextTheme = TextTheme(
    headline1: TextStyle(
      color: AppColors.amber,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    ),
    headline3: TextStyle(
      color: AppColors.dBackground,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    headline4: TextStyle(color: Colors.white, fontSize: 14),
    headline5: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 35,
    ),
    headline6: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );
}
