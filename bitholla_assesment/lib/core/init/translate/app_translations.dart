import 'package:bitholla_assesment/core/init/translate/tr_TR/tr_tr_translations.dart';
import 'en_US/en_us_translations.dart';


abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'tr_TR' : trTr
  };
}
 