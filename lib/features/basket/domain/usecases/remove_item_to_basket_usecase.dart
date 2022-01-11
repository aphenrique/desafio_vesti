import 'package:desafio_vesti/features/basket/domain/entities/basket.dart';
import 'package:desafio_vesti/features/basket/domain/entities/basket_item.dart';

class RemoveItemToBasketUsecase {
  final Basket basket;

  RemoveItemToBasketUsecase({
    required this.basket,
  });

  bool call(BasketItem basketItem) {
    BasketItem? item = basket.getBasketItemById(id: basketItem.productId);

    if (item == null) return false;

    if (item.quantity.value <= 1) {
      basket.basket.remove(basketItem);
      item.quantity.value--;
    } else {
      item.quantity.value--;
    }

    return true;
  }
}
