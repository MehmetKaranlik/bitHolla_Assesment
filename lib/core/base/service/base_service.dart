
import 'package:bitholla_assesment/core/base/service/base_network_service.dart';
import 'package:vexana/vexana.dart';

abstract class BaseService {
  INetworkManager networkManager = BaseNetworkService.instance.networkManager;
}
INetworkManager networkManager = BaseNetworkService.instance.networkManager;



