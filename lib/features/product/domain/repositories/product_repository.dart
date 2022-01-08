import 'package:desafio_vesti/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById({required int id});
}
