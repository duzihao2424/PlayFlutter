import 'package:dio/dio.dart';
import 'service_url.dart';

Dio dioWan() {
  Dio dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 5000;
  return dio;
}