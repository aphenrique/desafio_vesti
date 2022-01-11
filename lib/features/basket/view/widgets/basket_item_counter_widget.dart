import 'package:desafio_vesti/features/basket/view/controllers/basket_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketItemCounterWidget extends StatelessWidget {
  const BasketItemCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final basketQuantity = context.watch<BasketQuantity>();

    return SizedBox(
      width: 30,
      height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: ValueListenableBuilder(
            valueListenable: context.watch<BasketQuantity>(),
            builder: (context, value, child) => Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
