import 'package:kitchenwise/api.dart';

class Recipe {
  Recipe({
    required this.title,
    this.description = '',
    this.ingredients = const [],
    this.id = 0,
  });

  int id;
  final String title;
  final String description;
  final List<String> ingredients;
  late Future<String?> imageUrl;

  void setImageUrl() {
    imageUrl = fetchImageUrl(title);
  }
}
