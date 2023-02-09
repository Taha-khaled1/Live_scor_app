import 'package:dio/dio.dart';
//flutter pub run flutter_native_splash:create
import '../../container_injector.dart';
import '../utils/app_constants.dart';
import 'interceptors.dart';

//04b61cece298410b86e20133a9e8b083 -- news
const String _contentType = "Content-Type";
const String _applicationJson = "application/json";
const String _apiKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"; // Add your api key here
const int _timeOut = 20000;

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio}) {
    Map<String, dynamic> headers = {
      _contentType: _applicationJson,
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '4279e76cb96a94d1a8dd3877c7d63639',
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: _timeOut,
      connectTimeout: _timeOut,
      headers: headers,
    );
    dio.interceptors.add(sl<LogInterceptor>());
    dio.interceptors.add(sl<AppInterceptors>());
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(url, queryParameters: queryParams);
  }
}
