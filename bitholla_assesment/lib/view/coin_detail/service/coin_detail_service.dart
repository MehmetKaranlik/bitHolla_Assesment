import 'package:bitholla_assesment/core/base/service/base_service.dart';
import 'package:bitholla_assesment/core/constants/enum/network_path.dart';
import 'package:bitholla_assesment/view/coin_detail/model/currency_chart_model.dart';
import 'package:bitholla_assesment/view/coin_detail/service/ICoin_detail_service.dart';
import 'package:vexana/vexana.dart';

class CoinDetailService extends ICoinDetailViewService {
  CoinDetailService(INetworkManager iNetworkManager) : super(iNetworkManager);
  @override
  Future<List<CurrencyPriceChartModel>?> fecthChartData(
      String currencySymbol, String resolution, String from, String to) async {
    var response = await networkManager.send<CurrencyPriceChartModel, List<CurrencyPriceChartModel>>(
        NetworkPath.BASE_URL.path +
            NetworkPath.GET_CHART.path +
            'symbol=$currencySymbol&resolution=$resolution&from=$from&to=$to',
        parseModel: CurrencyPriceChartModel(),
        method: RequestType.GET);

    if (response.data != null) {
      return response.data;
    }
  }
}
