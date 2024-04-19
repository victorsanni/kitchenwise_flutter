import 'package:kitchenwise/api.dart';

class InventoryItem {
  InventoryItem({required this.name, this.quantity = 1, this.unit = ''});

  final String name;
  final int quantity;
  final String unit;
    late Future<String?> imageUrl;


  void setImageUrl() {
    imageUrl = fetchImageUrl(name);
  }
}
