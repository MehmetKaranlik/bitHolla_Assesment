enum NetworkPath {
  BASE_URL,
 
}

extension NetworkPathValue on NetworkPath {
  String get path {
    switch (this) {
      case NetworkPath.BASE_URL:
        return 'https://api.hollaex.com';

      default:
        throw 'Not Found';
    }
  }
}
