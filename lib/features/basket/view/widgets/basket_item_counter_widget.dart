import 'package:desafio_vesti/features/basket/view/controllers/basket_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketItemCounterWidget extends StatelessWidget {
  const BasketItemCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var basketQuantity = context.watch<BasketQuantity>();

    return Visibility(
      visible: basketQuantity.value > 0 ? true : false,
      child: SizedBox(
        width: 30,
        height: 30,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text(
              basketQuantity.value.toString().length > 1
                  ? basketQuantity.value.toString()
                  : "0${basketQuantity.value.toString()}",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
