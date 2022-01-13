class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants get instance {
    _instance ??= _instance = ApplicationConstants._init();
    return _instance!;
  }

  ApplicationConstants._init();
  static const FONT_FAMILY = 'NunitoSans';
  
}
