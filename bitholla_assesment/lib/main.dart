import 'package:bitholla_assesment/core/base/binding/base_bindings.dart';
import 'package:bitholla_assesment/core/base/view/base_view.dart';
import 'package:bitholla_assesment/core/init/theme/app_theme_light.dart';
import 'package:bitholla_assesment/view/base/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: BaseBinding(),
            smartManagement: SmartManagement.full,
            theme: AppThemeLight.instance.theme,
            home: const HomeView());
      },
    );
  }
}
