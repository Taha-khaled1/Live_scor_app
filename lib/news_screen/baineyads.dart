import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_score/news_screen/constant.dart';

class bainey2 extends StatefulWidget {
  const bainey2({Key? key});

  @override
  State<bainey2> createState() => _bainey2State();
}

class _bainey2State extends State<bainey2> {
  BannerAd? bannerAd;
  bool isready = false;
  final AdSize adsize = AdSize.banner;
  void createBannerAdfun() {
    bannerAd = BannerAd(
      size: adsize,
      adUnitId: ClassAds().adsTestorRealbainery(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isready = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          log('erorrrrrrrrrr  ${error.message}');
        },
      ),
      request: AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  void initState() {
    createBannerAdfun();
    super.initState();
  }

  // <meta-data
  //           android:name="com.google.android.gms.ads.APPLICATION_ID"
  //           android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
  @override
  void dispose() {
    bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isready) {
      return Container(
        alignment: Alignment.center,
        width: adsize.width.toDouble(),
        height: adsize.height.toDouble(),
        child: AdWidget(ad: bannerAd!),
      );
    } else {
      return Container();
    }
  }
}
