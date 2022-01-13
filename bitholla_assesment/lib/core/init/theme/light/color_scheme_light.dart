import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= _instance = ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();

  final Color turquoise = const Color(0xff00ad97);
  final Color turquoiseLight = const Color(0xff00d3b8);
  final Color black = const Color(0xff1c172f);
  final Color red = const Color(0xfffd687d);
  final Color grey = const Color(0xff9e9db6);
  final Color white = const Color(0xffffffff);



}
