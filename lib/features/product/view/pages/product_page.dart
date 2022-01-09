import 'package:flutter/material.dart';

import 'package:desafio_vesti/features/product/data/datasource/dio/dio_datasource.dart';
import 'package:desafio_vesti/features/product/data/repositories/product_repository_impl.dart';
import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_products_usecase.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final productList = ProductListController(
      GetProductsUsecase(ProductRepositoryImpl(DioDatasource())));

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width / 2 - 2;
    double _height = _width * (5 / 3);

    return Container(
      width: _width,
      height: _height,
      color: Colors.white,
      margin: const EdgeInsets.all(1),
      child: Stack(
        children: [
          Positioned.fill(
            left: 20,
            bottom: 70,
            right: 30,
            top: 20,
            child: InkResponse(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 44,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$ ${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_outline_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 40,
              // height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: false,
                    child: InkResponse(
                      onTap: () {},
                      child: const SizedBox(
                        height: 40,
                        child: Icon(
                          Icons.minimize,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: const Text(
                        "02",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  InkResponse(
                    onTap: () {},
                    child: const SizedBox(
                      height: 40,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
