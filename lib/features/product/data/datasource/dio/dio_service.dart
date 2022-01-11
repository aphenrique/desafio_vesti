import 'package:dio/dio.dart';

import 'package:desafio_vesti/utils/http_service.dart';

class DioService implements HttpService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {'content-type': 'application/json;charset=utf-8'},
    ),
  );

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }
}
