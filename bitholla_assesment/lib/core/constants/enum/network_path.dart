enum NetworkPath {
  BASE_URL,
  GET_CHART,
}

extension NetworkPathValue on NetworkPath {
  String get path {
    switch (this) {
      case NetworkPath.BASE_URL:
        return 'https://api.hollaex.com';
      case NetworkPath.GET_CHART:
        return '/v2/chart?';

      default:
        throw 'Not Found';
    }
  }
}
