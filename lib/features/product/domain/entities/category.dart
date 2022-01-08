class Category {
  final String category;

  Category({
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      category: map['category'] ?? '',
    );
  }
}
