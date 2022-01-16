import 'package:get/get.dart';


class CoinDetailTabGroupController extends GetxController {
    final RxInt _selectedTabTag = 0.obs;
  int get selectedTabTag => _selectedTabTag.value;
  set selectedTabTag(int val) => _selectedTabTag.value = val;
}