class SvgConstants {
  static SvgConstants? _instance;
  static SvgConstants get instance {
    _instance ??= _instance = SvgConstants._init();
    return _instance!;
  }

  SvgConstants._init();
  String toSvg(String value) => 'assets/svg/$value.svg';
  // Favrea Logo
  String get bitcoinIcon => toSvg('bitcoin_icon');
  String get allPageIcon => toSvg('all_page_icon');
}
