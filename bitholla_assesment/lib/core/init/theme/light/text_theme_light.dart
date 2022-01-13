import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  final TextStyle headline2 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  final TextStyle headline3 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  final TextStyle body1 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  final TextStyle body2 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  final TextStyle body3 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  final TextStyle body4 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );
}
