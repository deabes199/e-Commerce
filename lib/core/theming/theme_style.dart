import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class AppThemes {
  AppThemes._();
  static ThemeData get light => ThemeData(
    
   
      colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lighterGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.lighterGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.lighterGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ));

  static ThemeData get dark => ThemeData(
      colorScheme: const ColorScheme.dark(primary: AppColors.primaryColor),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.black,
      useMaterial3: true,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ));
}
