import 'package:desafio_vesti/features/product/domain/entities/category.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_categories_usecase.dart';
import 'package:flutter/cupertino.dart';

class CategoryListController extends ValueNotifier<List<Category>> {
  final GetCategoriesUsecase usecase;
  CategoryListController(this.usecase) : super(<Category>[]) {
    usecase().then((categories) {
      value = categories;
    });
  }

  List<Category> getCategoriesWidgets() =>
      value.map((e) => Category(category: e.toString())).toList();

  filterProductsByCategory(String category) =>
      value.where((element) => element.category.contains(category)).toList();
}
