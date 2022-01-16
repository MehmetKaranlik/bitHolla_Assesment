class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= _instance = ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();
  String get coinLogo => toPng('xht_logo');

  String toPng(value) => 'assets/icons/$value.png';
}
