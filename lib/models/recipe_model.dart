class Recipe {
  Recipe({
    required this.title,
    this.description = '',
    this.ingredients = const [],
    this.imageUrl =
        'https://upload.wikimedia.org/wikipedia/commons/4/4b/Beans_in_a_supermarket.jpg',
  });

  final String title;
  final String description;
  final List<String> ingredients;
  final String imageUrl;
}
