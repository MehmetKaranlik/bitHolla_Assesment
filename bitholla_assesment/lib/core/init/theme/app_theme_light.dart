// ignore_for_file: deprecated_member_use

import 'package:bitholla_assesment/core/constants/application/application_constants.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      primaryColor: colorSchemeLight.turquoise, // this value will be change when primary color defined
      fontFamily: ApplicationConstants.FONT_FAMILY,
      colorScheme: _appColorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorSchemeLight.white,
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
      backgroundColor: colorSchemeLight.white,
      foregroundColor: colorSchemeLight.white,
    );
  }

  TextTheme get textTheme {
    return ThemeData.light()
        .textTheme
        .copyWith(
            headline1: textThemeLight!.headline1,
            headline2: textThemeLight!.headline2,
            headline3: textThemeLight!.headline3,
            bodyText1: textThemeLight!.body1,
            bodyText2: textThemeLight!.body2,
            subtitle1: textThemeLight!.body3,
            subtitle2: textThemeLight!.body4)
        .apply(bodyColor: colorSchemeLight.turquoise, fontFamily: ApplicationConstants.FONT_FAMILY);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight.turquoise,
      primaryVariant: colorSchemeLight.turquoiseLight,
      secondary: colorSchemeLight.black,
      secondaryVariant: Colors.transparent,
      surface: Colors.transparent,
      onPrimary: colorSchemeLight.grey,
      onSecondary: Colors.transparent,
      onSurface: colorSchemeLight.shadowColor,
      onBackground: Colors.transparent,
      onError: colorSchemeLight.red,
      background: colorSchemeLight.white,
      error: colorSchemeLight.red, //unused
      brightness: Brightness.light,
    );
  }
}
