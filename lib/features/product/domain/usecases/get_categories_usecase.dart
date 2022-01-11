import 'package:desafio_vesti/features/product/domain/entities/category.dart';
import 'package:desafio_vesti/features/product/domain/repositories/catagory_repository.dart';

class GetCategoriesUsecase {
  CategoryRepository repository;

  GetCategoriesUsecase(this.repository);

  Future<List<Category>> call() async => await repository.getCategories();
}
