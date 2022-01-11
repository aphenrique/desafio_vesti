import 'package:flutter/material.dart';

class BasketQuantity extends ValueNotifier<int> {
  BasketQuantity() : super(0);

  set quantity(int quantity) => value = quantity;
}
