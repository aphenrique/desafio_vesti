abstract class GetProductsDatasource {
  Future<List<Map<String, dynamic>>> getProducts();
  Future<Map<String, dynamic>> getProductById({required int id});
}
