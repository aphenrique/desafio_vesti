import 'package:desafio_vesti/features/product/data/datasource/get_product_datasource.dart';
import 'package:desafio_vesti/features/product/utils/app_endpoint.dart';
import 'package:dio/dio.dart';

class DioDatasource implements GetProductsDatasource {
  late Dio _dio;

  DioDatasource() {
    _dio = Dio(
      BaseOptions(
        headers: {'content-type': 'application/json;charset=utf-8'},
      ),
    );
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final response = await get(AppEndpoint.products);

      final List data = response.data as List;

      final list = data.map((e) => Map<String, dynamic>.from(e)).toList();

      return list;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getProductById({required int id}) async {
    try {
      final response = await get(AppEndpoint.productById(id: id));

      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
