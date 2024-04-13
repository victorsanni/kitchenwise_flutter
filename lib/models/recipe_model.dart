class Recipe {
  Recipe({
    required this.title,
    this.description = '',
    this.ingredients = const [],
    this.imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Rice_grains_%28IRRI%29.jpg',
  });

  final String title;
  final String description;
  final List<String> ingredients;
  final String imageUrl;
}
