class AppEndpoint {
  static const String domain = "https://fakestoreapi.com/";

  static const String products = "$domain/products";

  static productById({required int id}) => "$products/$id";

  static const String categories = "$domain/products/categories";

  static categoryByCategory({required String category}) =>
      "$products/$category";
}
