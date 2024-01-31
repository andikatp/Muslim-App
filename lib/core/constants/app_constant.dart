class AppConstant {
  const AppConstant._();

  static const String baseUrl = 'https://api.myquran.com/v2/sholat/jadwal/0119';
  static const String baseQuranUrl = 'https://equran.id/api/surat';

  static const ustadImage = 'assets/Rectangle.jpg';
  static const ustadAva = 'assets/ustad2.png';

  // error message
  static const String noInternetConnection = 'Please check your connection';
  static const String serverFailureMessage =
      'Ups, API Error. please try again!';
  static const String cacheFailureMessage = 'Ups, API Error. please try again!';
  static const String generalFailureMessage = 'Ups, check your connection';

  static const int successfulHttpGetStatusCode = 200;

  static const int nisabEmasPerBulan = 81945667;
  static const int nisabGajiPerBulan = 6828806;
}
