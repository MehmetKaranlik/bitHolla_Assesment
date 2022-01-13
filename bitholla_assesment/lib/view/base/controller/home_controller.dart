import 'package:bitholla_assesment/core/base/controller/base_controller.dart';
import 'package:get/state_manager.dart';

class HomeController extends BaseController {
  final RxInt _selectedBody = 0.obs;
  int get selectedBody => _selectedBody.value;
  set selectedBody(int val) => _selectedBody.value = val;
}