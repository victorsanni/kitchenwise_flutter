import 'package:kitchenwise/models/inventory_model.dart';

class InventoryList {
  InventoryList({required this.inventoryList, required this.rsum});

  List<InventoryItem> inventoryList;
  int rsum;

  factory InventoryList.fromList(List<InventoryItem> dataList) {
    int id = 0;
    List<InventoryItem> newList = [];
    for (InventoryItem inventoryitem in dataList) {
      inventoryitem.id = id;
      newList.add(inventoryitem);
      id += 1;
    }
    return InventoryList(inventoryList: newList, rsum: newList.length);
  }

  int get length => inventoryList.length;

  void add(InventoryItem inventoryitem) {
    inventoryitem.id = rsum;
    inventoryList.add(inventoryitem);
    rsum += 1;
  }

  void remove(int id) {
    inventoryList.removeWhere((item) => item.id == id);
  }

  InventoryItem getById(int id) {
    return inventoryList.firstWhere((item) => item.id == id);
  }

  void setById(int id, String name, int quantity, String unit) {
    int index = inventoryList
        .indexOf(inventoryList.firstWhere((item) => item.id == id));
    inventoryList[index].name = name;
    inventoryList[index].quantity = quantity;
    inventoryList[index].unit = unit;
  }
}
