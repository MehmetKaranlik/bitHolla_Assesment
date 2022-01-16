// ignore_for_file: deprecated_member_use

import 'package:bitholla_assesment/core/constants/application/application_constants.dart';
import 'package:bitholla_assesment/core/init/theme/dark/dark_theme_interface.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
      primaryColor: colorSchemeDark.turquoise, // this value will be change when primary color defined
      fontFamily: ApplicationConstants.FONT_FAMILY,
      colorScheme: _appColorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorSchemeDark.red,
      tabBarTheme: tabBarTheme,
      appBarTheme: appBarTheme);

  TabBarTheme get tabBarTheme {
    return const TabBarTheme(
      labelColor: Color(0xff707070),
      unselectedLabelColor: Color(0xffA1B0D1),
    );
  }

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      backgroundColor: colorSchemeDark.white,
      foregroundColor: colorSchemeDark.white,
    );
  }

  TextTheme get textTheme {
    return ThemeData.light()
        .textTheme
        .copyWith(
            headline1: textThemeDark!.headline1,
            headline2: textThemeDark!.headline2,
            headline3: textThemeDark!.headline3,
            bodyText1: textThemeDark!.body1,
            bodyText2: textThemeDark!.body2,
            subtitle1: textThemeDark!.body3,
            subtitle2: textThemeDark!.body4)
        .apply(bodyColor: colorSchemeDark.turquoise, fontFamily: ApplicationConstants.FONT_FAMILY);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeDark.turquoise,
      primaryVariant: colorSchemeDark.turquoiseLight,
      secondary: colorSchemeDark.black,
      secondaryVariant: Colors.transparent,
      surface: Colors.transparent,
      onPrimary: colorSchemeDark.grey,
      onSecondary: Colors.transparent,
      onSurface: colorSchemeDark.shadowColor,
      onBackground: Colors.transparent,
      onError: colorSchemeDark.red,
      background: colorSchemeDark.white,
      error: colorSchemeDark.red, //unused
      brightness: Brightness.light,
    );
  }
}
