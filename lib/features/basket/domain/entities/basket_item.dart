import 'package:flutter/foundation.dart';

class BasketItem {
  final int productId;
  final double price;
  final ValueNotifier<int> quantity = ValueNotifier(0);

  BasketItem({
    required this.productId,
    required this.price,
  });

  add() => quantity.value++;
  remove() => quantity.value--;
}
