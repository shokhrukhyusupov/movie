import 'package:flutter/material.dart';
import 'package:movie/styles/text_styles.dart';

import 'colors.dart';

abstract class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    textTheme: TextThemes.dTextTheme,
    iconTheme: const IconThemeData(color: AppColors.amber),
    colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.amber),
    canvasColor: AppColors.dcanvas,
    splashColor: AppColors.amber,
    scaffoldBackgroundColor: AppColors.dBackground,
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.amber,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.amber,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: AppColors.amber),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.2),
        primary: Colors.black,
        fixedSize: const Size.square(55),
        elevation: 0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 45),
        primary: AppColors.amber,
        shadowColor: AppColors.amber,
        onPrimary: Colors.black,
        elevation: 0,
      ),
    ),
  );
}
