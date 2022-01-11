import 'package:desafio_vesti/features/product/data/datasource/dio/dio_products_datasource.dart';
import 'package:desafio_vesti/features/product/data/datasource/dio/dio_service.dart';
import 'package:desafio_vesti/features/product/data/datasource/get_product_datasource.dart';
import 'package:desafio_vesti/features/product/data/repositories/product_repository_impl.dart';
import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/domain/repositories/product_repository.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:desafio_vesti/utils/http_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Shoud return a product by id', () async {
    final HttpService service = DioService();
    final GetProductsDatasource datasource = DioProductsDatasource(service);

    final ProductRepository repository = ProductRepositoryImpl(datasource);

    final usecase = GetProductByIdUsecase(repository);

    Product product = await usecase(id: 2);

    expect(product.title, "Mens Casual Premium Slim Fit T-Shirts ");
  });
}
