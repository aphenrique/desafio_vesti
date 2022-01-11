import 'package:desafio_vesti/features/basket/domain/entities/basket.dart';
import 'package:desafio_vesti/features/basket/domain/entities/basket_item.dart';
import 'package:desafio_vesti/features/basket/view/controllers/basket_quantity.dart';
import 'package:desafio_vesti/features/product/domain/entities/product.dart';
import 'package:desafio_vesti/features/product/view/pages/product_page.dart';
import 'package:desafio_vesti/features/product/view/widgets/basket_item_manage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatefulWidget {
  final Product product;
  late final BasketItem basketItem;

  ProductViewWidget({
    Key? key,
    required this.product,
  }) : super(key: key) {
    basketItem = BasketItem(
      productId: product.id!,
      price: product.price,
    );
  }

  @override
  State<ProductViewWidget> createState() => _ProductViewWidgetState();
}

class _ProductViewWidgetState extends State<ProductViewWidget> {
  late final BasketItem basketItem;
  late final Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    basketItem = widget.basketItem;
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width / 2 - 2;
    double _height = _width * (5 / 3);

    final basket = context.read<Basket>();
    final basketQuantity = context.watch<BasketQuantity>();

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      product: product,
                      basketItem: basketItem,
                    ),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Image.network(
                  widget.product.image,
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
                  "\$ ${widget.product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.product.title,
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
              child: BasketItemManageButtonWidget(basketItem: basketItem)),
        ],
      ),
    );
  }
}
