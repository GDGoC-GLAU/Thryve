import 'package:flutter/material.dart';
import '../constants/export.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryAppColor,
      brightness: Brightness.light,
      primary: AppColors.primaryAppColor,
      onPrimary: AppColors.white,
      secondary: AppColors.lightGreen,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      titleTextStyle: AppTextTheme.size16Normal.copyWith(color: AppColors.black),
    ),
    snackBarTheme: SnackBarThemeData(
      closeIconColor: AppColors.white,
      showCloseIcon: true,
      backgroundColor: AppColors.darkGreen,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(color: AppColors.white),
    ),
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
  );
}
