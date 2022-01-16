import 'package:bitholla_assesment/view/base/controller/home_controller.dart';
import 'package:bitholla_assesment/view/coin_detail/controller/coin_detail_controller.dart';
import 'package:get/get.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    }, fenix: true);

    Get.lazyPut<CoinDetailViewController>(() {
      return CoinDetailViewController();
    }, fenix: true);
  }
}
