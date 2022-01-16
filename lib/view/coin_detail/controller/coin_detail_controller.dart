// ignore_for_file: invalid_use_of_protected_member, prefer_final_fields
import 'dart:async';
import 'dart:convert';

import 'package:bitholla_assesment/core/base/controller/base_controller.dart';
import 'package:bitholla_assesment/core/base/service/base_service.dart';
import 'package:bitholla_assesment/core/constants/application/application_constants.dart';
import 'package:bitholla_assesment/core/constants/enum/network_path.dart';
import 'package:bitholla_assesment/view/coin_detail/model/currency_chart_model.dart';
import 'package:bitholla_assesment/view/coin_detail/service/coin_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class CoinDetailViewController extends BaseController {
  late final CoinDetailService _service;
  var dateTimeNow = DateTime.now().toString();
  late final Timer _timer;

  //web socket observable value
  Rx<IOWebSocketChannel> _channel = IOWebSocketChannel.connect(
    NetworkPath.WEB_SOCKET_BASE_URL.path + NetworkPath.STREAM_PATH.path,
  ).obs;
  IOWebSocketChannel get channel => _channel.value;

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

  final RxBool _isWebScoketLoading = true.obs;
  bool get isWebScoketLoading => _isWebScoketLoading.value;
  set isWebScoketLoading(bool val) => _isWebScoketLoading.value = val;

  @override
  void onReady() {
    createSocket();
    super.onReady();
  }

  @override
  void onInit() {
    _service = CoinDetailService(networkManager);
    getCurrenyChartData();

    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    socketClosing();
  }

// steps to cancel&close websocket
  void socketClosing() {
    _timer.cancel();
    channel.stream.listen(
      (event) {},
      onDone: () {
        channel.sink.add((jsonEncode({
          'op': 'unsubscribe',
          'args': ['orderbook:xht-usdt']
        })));
      },
    );
    channel.sink.close(
      status.goingAway,
    );
    super.dispose();
  }

  void createSocket() {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      channel.sink.add(
        jsonEncode(
          {'op': 'ping'},
        ),
      );
    });
    channel.sink.add(
      jsonEncode(
        {'op': 'ping'},
      ),
    );

    channel.sink.add(
      jsonEncode(
        {
          'op': 'subscribe',
          'args': ['orderbook:xht-usdt']
        },
      ),
    );
  }

  Future<void> getCurrenyChartData() async {
    isLoading = true;
    var data = await _service.fecthChartData("xht-usdt", "1D", "1616987453", "1619579513");
    if (data != null) {
      chartData.clear();
      chartData = data;
      isLoading = false;
    }
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
}
