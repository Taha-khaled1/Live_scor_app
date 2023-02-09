import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc_observer.dart';
import 'src/container_injector.dart';
import 'src/my_app.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  prefs.setString('a', '1');

  MobileAds.instance.initialize();
  initApp();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
