// ignore_for_file: prefer_const_constructors

import 'package:desafio_vesti/features/basket/domain/entities/basket_item.dart';
import 'package:desafio_vesti/features/basket/domain/usecases/add_item_to_basket_usecase.dart';
import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/view/widgets/color_value.dart';
import 'package:desafio_vesti/features/product/view/widgets/custom_color_radio.dart';
import 'package:desafio_vesti/features/product/view/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  final BasketItem basketItem;

  const ProductPage({
    Key? key,
    required this.product,
    required this.basketItem,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final colorValue = ColorValue();

  bool isClothingCategory = false;

  @override
  Widget build(BuildContext context) {
    isClothingCategory =
        widget.product.category.contains("clothing") ? true : false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            widget.product.title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  color: Colors.grey,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Hero(
                      tag: widget.product.id.toString(),
                      child: Image.network(
                        widget.product.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: isClothingCategory,
                    child: ProductInfoWidget(
                      subtitle: "Size (US):",
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("4"),
                          Text("6"),
                          Text("8"),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isClothingCategory,
                    child: ProductInfoWidget(
                        subtitle: "Color:",
                        content: CustomColorRadio(colorValue: colorValue)),
                  ),
                  ProductInfoWidget(
                    subtitle: "Description:",
                    content: Text(widget.product.description,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  ProductInfoWidget(
                    subtitle: "Price:",
                    content: Text(
                      "\$ ${widget.product.price}",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 10,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final addbasketItemUsecase =
                          context.read<AddItemToBasketUsecase>();

                      addbasketItemUsecase(widget.basketItem);
                    },
                    child: const Text(
                      "Add to basket",
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
