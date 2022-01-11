import 'package:desafio_vesti/features/basket/domain/entities/basket.dart';
import 'package:desafio_vesti/features/basket/domain/usecases/add_item_to_basket_usecase.dart';
import 'package:desafio_vesti/features/basket/domain/usecases/remove_item_to_basket_usecase.dart';
import 'package:desafio_vesti/features/basket/view/controllers/basket_quantity.dart';
import 'package:flutter/material.dart';

import 'package:desafio_vesti/features/basket/domain/entities/basket_item.dart';
import 'package:provider/provider.dart';

class BasketItemManageButtonWidget extends StatefulWidget {
  final BasketItem basketItem;

  const BasketItemManageButtonWidget({
    Key? key,
    required this.basketItem,
  }) : super(key: key);

  @override
  State<BasketItemManageButtonWidget> createState() =>
      _BasketItemManageButtonWidgetState();
}

class _BasketItemManageButtonWidgetState
    extends State<BasketItemManageButtonWidget> {
  late final BasketItem basketItem;

  late final Basket basket;

  @override
  void initState() {
    super.initState();
    basketItem = widget.basketItem;
  }

  @override
  Widget build(BuildContext context) {
    var basketQuantity = context.watch<BasketQuantity>();
    var basket = context.watch<Basket>();
    return Container(
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: basketItem.quantity > 0 ? true : false,
            child: InkResponse(
              onTap: () {
                final removeItemUsecase =
                    context.read<RemoveItemToBasketUsecase>();

                if (removeItemUsecase(basketItem)) {
                  basketQuantity.value = basket.totalItems;
                  setState(() {});
                }
              },
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
            visible: basketItem.quantity > 0 ? true : false,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                basketItem.quantity.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkResponse(
            onTap: () {
              var addItemUsecase = context.read<AddItemToBasketUsecase>();

              if (addItemUsecase(basketItem)) {
                basketQuantity.quantity = basket.totalItems;
                setState(() {});
              }
            },
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
    );
  }
}
