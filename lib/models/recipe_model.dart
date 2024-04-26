import 'package:kitchenwise/api.dart';

class Recipe {
  Recipe({
    required this.title,
    this.description = '',
    this.ingredients = const [],
    this.id = 0,
    this.isMine = false,
  });

  int id;
  String title;
  String description;
  List<String> ingredients;
  late Future<String?> imageUrl;
  bool isMine;

  void setImageUrl() {
    imageUrl = fetchImageUrl(title);
  }
}
