import 'package:bitholla_assesment/core/base/controller/base_controller.dart';
import 'package:bitholla_assesment/core/base/service/base_service.dart';
import 'package:bitholla_assesment/core/constants/application/application_constants.dart';
import 'package:bitholla_assesment/view/coin_detail/model/currency_chart_model.dart';
import 'package:bitholla_assesment/view/coin_detail/service/coin_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinDetailViewController extends BaseController {
  late final CoinDetailService _service;
  var dateTimeNow = DateTime.now().toString();
// Chart data observable variable&getter&setter
  final RxList<CurrencyPriceChartModel> _chartData = <CurrencyPriceChartModel>[].obs;
  List<CurrencyPriceChartModel> get chartData => _chartData.value;
  set chartData(List<CurrencyPriceChartModel> val) => _chartData.value = val;

  //0 => 1 year, 1 => 1 month, 2 => 1 week, 3 => 1 day, 4=> 1 hour corresponding values on switch case below
  final RxInt _zoomOption = 0.obs;
  int get zoomOption => _zoomOption.value;
  set zoomOption(int val) => _zoomOption.value = val;





  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool val) => _isLoading.value = val;

  @override
  void onInit() {
    _service = CoinDetailService(networkManager);
    getCurrenyChartData();
    super.onInit();
  }

  Future<void> getCurrenyChartData() async {
    isLoading = true;
    var data = await _service.fecthChartData("xht-usdt", "1D", "1616987453", "1619579513");
    if (data != null) {
      chartData.clear();
      chartData = data;
      isLoading = false;
      print("if çalıştı $isLoading");
    }
    print("if çalışmadı $isLoading");
  }

  List<AreaSeries<CurrencyPriceChartModel, DateTime>> getDefaultLineSeries(BuildContext context) {
    return <AreaSeries<CurrencyPriceChartModel, DateTime>>[
      AreaSeries<CurrencyPriceChartModel, DateTime>(
          dataSource: chartData,
          gradient: ApplicationConstants.chartLinearGradient(context),
          xValueMapper: (CurrencyPriceChartModel point, _) => point.time,
          yValueMapper: (CurrencyPriceChartModel point, _) => point.open,
          color: context.theme.colorScheme.primary,
          markerSettings: const MarkerSettings(isVisible: false))
    ];
  }

  // 403 response-- not working on demo app
  String defineZoomLevel(int input) {
    switch (input) {
      case 0:
        return DateTime.fromMicrosecondsSinceEpoch(DateTime.now().year - 1).toString();
      case 1:
        return DateTime.fromMicrosecondsSinceEpoch(DateTime.now().month - 1).toString();
      case 2:
        return DateTime.fromMicrosecondsSinceEpoch(DateTime.now().day - 7).toString();
      case 3:
        return DateTime.fromMicrosecondsSinceEpoch(DateTime.now().day - 1).toString();
      case 4:
        return DateTime.fromMicrosecondsSinceEpoch(DateTime.now().hour - 1).toString();
      default:
        throw "error";
    }
  }
}
