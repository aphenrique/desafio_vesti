import 'package:desafio_vesti/features/product/domain/entities/category.dart';
import 'package:desafio_vesti/features/product/domain/repositories/catagory_repository.dart';

class GetCategoryByCategoryUsecase {
  CategoryRepository repository;

  GetCategoryByCategoryUsecase({
    required this.repository,
  });

  Future<Category> call() async => await repository.getCategoryByCategory();
}
