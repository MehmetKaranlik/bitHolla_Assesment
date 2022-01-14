import 'dart:io';
import 'package:bitholla_assesment/core/constants/enum/network_path.dart';
import 'package:get/get.dart';
import 'package:vexana/vexana.dart';



class BaseNetworkService {
  static BaseNetworkService? _instance;
  static BaseNetworkService get instance {
    _instance ??= _instance = BaseNetworkService._init();
    return _instance!;
  }

  late INetworkManager networkManager;

  BaseNetworkService._init() {
    networkManager = networkManagerOptions();
  }

  Future<void> retryToken() async {
    _instance = BaseNetworkService._init();
  }

  NetworkManager networkManagerOptions() {
   
    return NetworkManager(

        options: BaseOptions(
          baseUrl: NetworkPath.BASE_URL.path,
        ),
        onRefreshFail: () async {
  
        },
  
        isEnableLogger: true);
  }

  

  
}
