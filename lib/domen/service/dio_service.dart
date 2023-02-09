import 'package:dio/dio.dart';

class DioService {
  Dio client() => Dio(BaseOptions(baseUrl: "https://onework.uz"))
    ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: false,
        responseHeader: false));
}
