import 'package:vexana/vexana.dart';

class CurrencyPriceChartModel extends INetworkModel{
  DateTime? time;
  double? close;
  double? high;
  double? low;
  double? open;
  String? symbol;
  num? volume;

  CurrencyPriceChartModel({this.time, this.close, this.high, this.low, this.open, this.symbol, this.volume});

  CurrencyPriceChartModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json["time"]);
    close = json['close'];
    high = json['high'];
    low = json['low'];
    open = json['open'];
    symbol = json['symbol'];
    volume = json['volume'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['close'] = close;
    data['high'] = high;
    data['low'] = low;
    data['open'] = open;
    data['symbol'] = symbol;
    data['volume'] = volume;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
   return CurrencyPriceChartModel.fromJson(json);
  }
}
