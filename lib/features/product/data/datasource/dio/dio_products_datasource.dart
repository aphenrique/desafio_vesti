import 'package:desafio_vesti/features/product/data/datasource/get_product_datasource.dart';
import 'package:desafio_vesti/utils/app_endpoint.dart';
import 'package:desafio_vesti/utils/http_service.dart';

class DioProductsDatasource implements GetProductsDatasource {
  final HttpService service;

  DioProductsDatasource(this.service);

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final response = await service.get(AppEndpoint.products);

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
      final response = await service.get(AppEndpoint.productById(id: id));

      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
