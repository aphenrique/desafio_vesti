import 'package:desafio_vesti/features/product/domain/usecases/get_products_usecase.dart';
import 'package:desafio_vesti/features/product/view/pages/product_page.dart';

import '../../domain/entities/product.dart';
import 'package:flutter/cupertino.dart';

class ProductListController extends ValueNotifier<List<Product>> {
  final GetProductsUsecase usecase;
  ProductListController(this.usecase) : super(<Product>[]) {
    usecase().then((productList) {
      value = productList;
    });
  }

  List<ProductPage> getProductsWidgets() => value
      .map((e) => ProductPage(
            product: e,
          ))
      .toList();

  filterProductsByCategory(String category) =>
      value.where((element) => element.category.contains(category)).toList();
}
