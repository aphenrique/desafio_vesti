import 'package:desafio_vesti/features/product/data/datasource/get_product_datasource.dart';
import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/domain/repositories/product_repository.dart';

class RepositoryImpl implements ProductRepository {
  GetProductsDatasource datasource;

  RepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts() async {
    final response = await datasource.getProducts();

    List<Product> list =
        response.map((element) => Product.fromMap(element)).toList();

    return list;
  }

  @override
  Future<Product> getProductById({required int id}) async {
    var response = await datasource.getProductById(id: id);

    Product product = Product.fromMap(response);

    return product;
  }
}
