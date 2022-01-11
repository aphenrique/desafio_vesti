import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/view/pages/product_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => Navigator.pushNamed(context, "/product_list_page"),
    );

    final product = Product.fromMap({
      "id": 4,
      "title": "Mens Casual Slim Fit",
      "price": 15.99,
      "description":
          "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
      "rating": {"rate": 2.1, "count": 430}
    });

    return Scaffold(
      // body: ProductPage(product: product),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
