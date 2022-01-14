import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class DoubleSidedListViewController extends GetxController {
  final RxInt _leftSelectedIndex = 0.obs;
  int get leftSelectedIndex => _leftSelectedIndex.value;
  set leftSelectedIndex(int val) => _leftSelectedIndex.value = val;

  final RxInt _rightSelectedIndex = 0.obs;
  int get rightSelectedIndex => _rightSelectedIndex.value;
  set rightSelectedIndex(int val) => _rightSelectedIndex.value = val;
}
