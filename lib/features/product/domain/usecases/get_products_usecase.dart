import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/domain/repositories/product_repository.dart';

class GetProductsUsecase {
  final ProductRepository repository;

  GetProductsUsecase(
    this.repository,
  );

  Future<List<Product>> call() async => await repository.getProducts();
}
