import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/colors.dart';

ThemeData appthemEN = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.main),
    scaffoldBackgroundColor: AppColors.scafold,
    // floatingActionButtonTheme:
    //     FloatingActionButtonThemeData(backgroundColor: AppColors.primarycolor),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 16,
            fontFamily: 'Kufi',
            fontWeight: FontWeight.bold,
            wordSpacing: 2,
            height: 1.5),
        displayLarge: TextStyle(
            fontSize: 25,
            fontFamily: 'Kufi',
            fontWeight: FontWeight.bold,
            color: AppColors.black)));

ThemeData appthemAR = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.main),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 16,
            fontFamily: 'Kufi',
            fontWeight: FontWeight.bold,
            wordSpacing: 2,
            height: 1.5),
        displayLarge: TextStyle(
            fontSize: 25,
            fontFamily: 'Kufi',
            fontWeight: FontWeight.bold,
            color: AppColors.black)));
