import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/shared_pref_helper.dart';
import 'package:hero_store_app/core/theming/theme_style.dart';
import 'package:meta/meta.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemes.light);
  Future<void> selectTheme(Brightness brightness) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    await SharedPrefHelper.setData('theme', themeIndex);
  }

  Future<void> getChachedTheme() async {
    final getThemeIndex =
        await SharedPrefHelper.sharedPreferences.getInt('theme');
    final savedTheme = getThemeIndex == 0 ? AppThemes.light : AppThemes.dark;
    emit(savedTheme);
  }

  Future<void> toggleTheme() async {
    emit(state.brightness == Brightness.light
        ? AppThemes.dark
        : AppThemes.light);
        selectTheme(state.brightness);
  }
}
