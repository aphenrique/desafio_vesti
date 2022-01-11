class BasketItem {
  final int productId;
  final double price;
  int quantity = 0;

  BasketItem({
    required this.productId,
    required this.price,
  });

  add() => quantity++;
  remove() => quantity--;
}
