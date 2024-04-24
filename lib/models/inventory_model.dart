import 'package:kitchenwise/api.dart';

class InventoryItem {
  InventoryItem(
      {this.id = 0, required this.name, this.quantity = 1, this.unit = ''});

  int id;
  String name;
  int quantity;
  String unit;
  late Future<String?> imageUrl;

  void setImageUrl() {
    imageUrl = fetchImageUrl(name);
  }
}
