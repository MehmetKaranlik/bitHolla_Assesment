import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CoinDetailTabGroupController extends GetxController {
    final RxInt _selectedTabTag = 0.obs;
  int get selectedTabTag => _selectedTabTag.value;
  set selectedTabTag(int val) => _selectedTabTag.value = val;
}