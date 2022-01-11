import 'package:desafio_vesti/features/product/view/controllers/category_list_controller.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMenuWidget extends StatelessWidget {
  const CategoryMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productList = context.watch<ProductListController>();
    final _categoryList = context.watch<CategoryListController>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            _productList.filterProductsByCategory("");
          },
          child: const Text("all"),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 3,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _categoryList.value
                  .map(
                    (e) => TextButton(
                      onPressed: () {
                        _productList.filterProductsByCategory(e.category);
                      },
                      child: Text(e.category),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
