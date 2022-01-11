import 'package:desafio_vesti/features/home/pages/home_page.dart';
import 'package:desafio_vesti/features/product/view/pages/product_list_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const homePage = "/";
  static const productListPage = "/product_list_page";

  Map<String, Widget Function(BuildContext)> call() => {
        homePage: (context) => const HomePage(),
        productListPage: (context) => const ProductListPage(),
      };
}
