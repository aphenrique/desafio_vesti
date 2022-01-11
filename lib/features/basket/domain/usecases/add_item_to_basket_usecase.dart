import 'package:desafio_vesti/features/basket/domain/entities/basket.dart';
import 'package:desafio_vesti/features/basket/domain/entities/basket_item.dart';

class AddItemToBasketUsecase {
  final Basket basket;

  AddItemToBasketUsecase({
    required this.basket,
  });

  bool call(BasketItem basketItem) {
    BasketItem? item = basket.getBasketItemById(id: basketItem.productId);

    if (item != null) {
      item.quantity.value++;
    } else {
      basket.basket.add(basketItem);
    }

    return true;
  }
}
