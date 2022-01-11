import 'basket_item.dart';

class Basket {
  Set<BasketItem> basket = {};

  int get totalItems => calculateTotalItems();

  int calculateTotalItems() {
    if (basket.isEmpty) return 0;

    int total = 0;

    for (var item in basket) {
      total += item.quantity;
    }

    return total;
  }

  double get totalPrice => calculateTotalPrice();

  double calculateTotalPrice() {
    if (basket.isEmpty) return 0;

    double total = 0;
    for (var item in basket) {
      total += item.price;
    }

    return total;
  }

  BasketItem? getBasketItemById({required int id}) {
    var items = basket.where((element) => element.productId == id);

    if (items.isEmpty) return null;

    return items.first;
  }
}
