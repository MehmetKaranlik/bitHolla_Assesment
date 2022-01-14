import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants get instance {
    _instance ??= _instance = ApplicationConstants._init();
    return _instance!;
  }

  ApplicationConstants._init();
  static const FONT_FAMILY = 'NunitoSans';

  static LinearGradient chartLinearGradient(BuildContext context) => LinearGradient(
        colors: [context.theme.colorScheme.primaryVariant, Colors.white],
        begin: Alignment.topCenter,
        tileMode: TileMode.repeated,
        end: Alignment.bottomCenter,
      );
}
