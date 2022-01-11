abstract class GetCategoriesDatasource {
  Future<List<String>> getCategories();
  Future<String> getCategoryByCategory({required String category});
}
