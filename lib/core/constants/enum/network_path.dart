enum NetworkPath { BASE_URL, GET_CHART, WEB_SOCKET_BASE_URL, STREAM_PATH }

extension NetworkPathValue on NetworkPath {
  String get path {
    switch (this) {
      case NetworkPath.BASE_URL:
        return 'https://api.xxxxx.com';
      case NetworkPath.GET_CHART:
        return '/v2/chart?';
      case NetworkPath.WEB_SOCKET_BASE_URL:
        return 'wss://api.xxxx.com';
      case NetworkPath.STREAM_PATH:
        return '/stream';
      default:
        throw 'Not Found';
    }
  }
}
