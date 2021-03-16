import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../env/Config.dart';

class MyDio {
  init() async {
    Dio _dio = Dio();
    if (Config().env == 'prod') return _dio;
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      //这一段是解决安卓https抓包的问题
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return Platform.isAndroid;
      };
      client.findProxy = (uri) {
        return "PROXY 127.0.0.1:8888";
      };
    };
    return _dio;
  }
}
