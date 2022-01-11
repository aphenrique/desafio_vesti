import 'package:desafio_vesti/features/product/data/datasource/get_categories_datasource.dart';
import 'package:desafio_vesti/features/product/domain/entities/category.dart';
import 'package:desafio_vesti/features/product/domain/repositories/catagory_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final GetCategoriesDatasource datasource;

  CategoryRepositoryImpl(this.datasource);

  @override
  Future<List<Category>> getCategories() async {
    final response = await datasource.getCategories();

    List<Category> list =
        response.map((element) => Category(category: element)).toList();

    return list;
  }

  @override
  Future<Category> getCategoryByCategory({required String category}) async {
    final response = await datasource.getCategoryByCategory(category: category);

    return Category(category: response);
  }
}
