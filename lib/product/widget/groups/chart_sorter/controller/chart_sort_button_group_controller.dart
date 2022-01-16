import 'package:get/get.dart';

class ChartSortButtonGroupController extends GetxController {
  List<String> chartTitleList = ["Today", "1W", "1M", "3M", "6M", "1Y"];
  //to define states of sort  buttons
  final RxInt _selectedSortButtonIndex = 0.obs;
  int get selectedSortButtonIndex => _selectedSortButtonIndex.value;
  set selectedSortButtonIndex(int val) => _selectedSortButtonIndex.value = val;
}
