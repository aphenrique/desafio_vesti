import 'package:desafio_vesti/features/product/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
  Future<Category> getCategoryByCategory({required String category});
}
