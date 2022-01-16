import 'package:bitholla_assesment/view/coin_detail/model/currency_chart_model.dart';
import 'package:vexana/vexana.dart';

abstract class ICoinDetailViewService {
  final INetworkManager iNetworkManager;

  ICoinDetailViewService(this.iNetworkManager);
  Future<List<CurrencyPriceChartModel>?> fecthChartData(
      String currencySymbol, String resolution, String from, String to);
}
