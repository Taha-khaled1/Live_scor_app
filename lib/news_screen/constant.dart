import 'package:google_mobile_ads/google_mobile_ads.dart';

class ClassAds {
  bool testmode = true;
  final String adUnitIdTest = 'ca-app-pub-3940256099942544/6300978111';
  final String bannerads = 'ca-app-pub-4219109694184528/5829131896';
  final String rewardads = 'ca-app-pub-4219109694184528/4324478537';
  final String baineyads = 'ca-app-pub-4219109694184528/4121298555';
  String adsTestorRealbannner(bool x) {
    if (x) {
      return adUnitIdTest;
    } else {
      return bannerads;
    }
  }

  String adsTestorRealbainery() {
    if (testmode) {
      return adUnitIdTest;
    } else {
      return baineyads;
    }
  }
}
