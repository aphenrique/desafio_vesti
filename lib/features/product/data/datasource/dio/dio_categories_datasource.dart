import 'package:desafio_vesti/features/product/data/datasource/get_categories_datasource.dart';
import 'package:desafio_vesti/utils/app_endpoint.dart';
import 'package:desafio_vesti/utils/http_service.dart';

class DioCategoriesDatasource implements GetCategoriesDatasource {
  final HttpService service;

  DioCategoriesDatasource(this.service);

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await service.get(AppEndpoint.categories);

      final List data = response.data as List;

      final list = data.map((e) => e.toString()).toList();

      return list;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getCategoryByCategory({required String category}) async {
    try {
      final response =
          await service.get(AppEndpoint.categoryByCategory(category: category));

      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
