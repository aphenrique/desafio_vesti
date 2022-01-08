import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/domain/repositories/product_repository.dart';

class GetProductByIdUsecase {
  final ProductRepository repository;

  GetProductByIdUsecase(this.repository);

  Future<Product> call({required int id}) async =>
      await repository.getProductById(id: id);
}
