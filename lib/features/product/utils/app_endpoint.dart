class AppEndpoint {
  static const String domain = "https://fakestoreapi.com/";

  static const String products = "$domain/products";

  static productById({required int id}) => "$products/$id";
}
