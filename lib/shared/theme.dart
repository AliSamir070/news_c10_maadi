import 'package:flutter/material.dart';
import 'package:news_c10_maadi/shared/app_colors.dart';

class AppTheme{
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor
    ),
    iconTheme: IconThemeData(
      size: 30,
      color: AppColors.textDrawerColor
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      toolbarHeight: 90,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        )
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: Colors.white
      ),
      iconTheme: IconThemeData(
        size: 20,
        color: Colors.white
      )
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700
      ),
      labelMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textDrawerColor
      )
    )
  );
}