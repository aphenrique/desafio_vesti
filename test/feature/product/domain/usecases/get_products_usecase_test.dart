import 'package:desafio_vesti/features/product/data/datasource/dio/dio_datasource.dart';
import 'package:desafio_vesti/features/product/data/datasource/get_product_datasource.dart';
import 'package:desafio_vesti/features/product/data/repositories/repository_impl.dart';
import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/domain/repositories/product_repository.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_products_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Shoud return a product`s list', () async {
    final GetProductsDatasource datasource = DioDatasource();

    final ProductRepository repository = RepositoryImpl(datasource);

    final usecase = GetProductsUsecase(repository);

    List<Product> list = await usecase();

    expect(list.length, 20);

    // expect(list[1].title, "Mens Casual Premium Slim Fit T-Shirts ");
  });
}
