import 'package:bitholla_assesment/core/base/controller/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final RxInt _selectedBody = 2.obs;
  int get selectedBody => _selectedBody.value;
}
