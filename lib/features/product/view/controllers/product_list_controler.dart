import 'package:desafio_vesti/features/product/domain/usecases/get_products_usecase.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/product.dart';

class ProductListController extends ValueNotifier<List<Product>> {
  final GetProductsUsecase usecase;
  List<Product> products = [];

  ProductListController(this.usecase) : super(<Product>[]) {
    usecase().then((productList) {
      products = productList;
      filterProductsByCategory(r"");
    });
  }

  filterProductsByCategory(String category) => value =
      products.where((element) => element.category.contains(category)).toList();
}
