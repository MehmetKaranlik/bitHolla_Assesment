import 'package:bitholla_assesment/core/constants/routes/routes_constants.dart';
import 'package:bitholla_assesment/view/coin_detail/view/coin_detail_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => Container()),
    GetPage(name: Routes.COIN_DETAIL, page: () => const CoinDetailView()),
  ];
}
