import 'package:bitholla_assesment/core/base/binding/base_bindings.dart';
import 'package:bitholla_assesment/core/init/cache/locale_manager.dart';
import 'package:bitholla_assesment/core/init/theme/app_theme_light.dart';
import 'package:bitholla_assesment/core/init/translate/app_translations.dart';
import 'package:bitholla_assesment/view/base/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
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
            translationsKeys: AppTranslation.translations,
            locale: Locale('tr', 'TR'),
            fallbackLocale: const Locale('tr', 'TR'),
            theme: AppThemeLight.instance.theme,
            home: const HomeView());
      },
    );
  }
}
