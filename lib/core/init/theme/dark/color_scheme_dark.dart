import 'package:flutter/material.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instance;
  static ColorSchemeDark get instance {
    _instance ??= _instance = ColorSchemeDark._init();
    return _instance!;
  }

  ColorSchemeDark._init();

  final Color turquoise = const Color(0xff00ad97);
  final Color turquoiseLight = const Color(0xff00d3b8);
  final Color black = const Color(0xff1c172f);
  final Color red = const Color(0xfffd687d);
  final Color grey = const Color(0xff9e9db6);
  final Color white = const Color(0xffffffff);
  final Color shadowColor = const Color(0x1a000000);



}
